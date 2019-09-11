import os
import turicreate

NAME_CLASSIFIER = "beer_classifier"

data = turicreate.image_analysis.load_images("images/")

data["label"] = data["path"].apply(lambda path: os.path.basename(os.path.dirname(path)))
data.save(f"{NAME_CLASSIFIER}.sframe")

data = turicreate.SFrame(f"{NAME_CLASSIFIER}.sframe")

testing, training = data.random_split(0.8)

classifier = turicreate.image_classifier.create(testing, target="label", model="resnet-50")

testing = classifier.evaluate(training)
print(testing["accuracy"])

classifier.save(f"{NAME_CLASSIFIER}.model")
classifier.export_coreml(f"{NAME_CLASSIFIER}.mlmodel")