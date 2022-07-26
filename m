Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 560EE581897
	for <lists+freedreno@lfdr.de>; Tue, 26 Jul 2022 19:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD94E95F05;
	Tue, 26 Jul 2022 17:39:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7EC95F4E
 for <freedreno@lists.freedesktop.org>; Tue, 26 Jul 2022 17:38:52 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 c19-20020a17090ae11300b001f2f94ed5c6so1312763pjz.1
 for <freedreno@lists.freedesktop.org>; Tue, 26 Jul 2022 10:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wmvETZN5Ha+yireouc7YVcvDiIVXAJJg/FoKJ92DJjU=;
 b=MksWHjPQg4rbAGIfFOV3GYEdoFoi5JyDDguOZEgeL+RCBQgPgco2HmMrFOUgzGPoWg
 IhcI7KjBNIb5SMTaglpPg92MUIaWzAid8OQ0WLOYidBVYnBfsdNEwQLxmKxck3xftLI5
 fwCVZ3cEMwKVvXZTJlqZGKrQWBkmucHSRozEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wmvETZN5Ha+yireouc7YVcvDiIVXAJJg/FoKJ92DJjU=;
 b=QBIx8ouOFSMbxObHT0NS8h5IwH2rCOCy9fks9rgXL0fJgW55MF37KnIRJa+xSOYelw
 qg6gVL/b8BXz5OEj451Vjg6xt7U0a6F1LS79A6Vf4g7XqOFKCi4hA9lwt1mVu6G3Dpxi
 DjqmN3u8FuDwkncTwG+hAnS/7AaJh/sBLNVP4qQIycAq7C75A8ueITvN/prXoM0pXSj7
 KBChvOXw0Hv8lhVJ95tvCd7xSoyp4Y2htwSVBZWNDC0z2ILxNLzpNDV+FoyUAAuZMeGn
 yAzGoR9ABezVBv3ZJiKYW9MmR1e3/WQeEn+GW20vzOTl3wEUDA+79WwIBFPR8uyZefF8
 gTkw==
X-Gm-Message-State: AJIora/yLp8qZbO8w51YslhvZ6D9qBkV3rBrM6E0MDiEzpHoYfxGerG9
 3f3dmJTUCdzfOUqajeGaY/Kr5QqDr4st1v7b
X-Google-Smtp-Source: AGRyM1u3xzf+HZdNlx0FPajthsuPbfpneKaEGEFjTphXREaGSlyM06EiwS5p9j+HCf/rC2oEpPwDRQ==
X-Received: by 2002:a17:902:7c0d:b0:16d:500b:1255 with SMTP id
 x13-20020a1709027c0d00b0016d500b1255mr16942650pll.98.1658857132520; 
 Tue, 26 Jul 2022 10:38:52 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:8693:e9aa:75c0:5134])
 by smtp.gmail.com with ESMTPSA id
 ik29-20020a170902ab1d00b0016d9ecd71f4sm245884plb.77.2022.07.26.10.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 10:38:51 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Mark Brown <broonie@kernel.org>
Date: Tue, 26 Jul 2022 10:38:23 -0700
Message-Id: <20220726103631.v2.6.I38fc508a73135a5c1b873851f3553ff2a3a625f5@changeid>
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
In-Reply-To: <20220726173824.1166873-1-dianders@chromium.org>
References: <20220726173824.1166873-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 6/7] regulator: core: Allow drivers to define
 their init data as const
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Drivers tend to want to define the names of their regulators somewhere
in their source file as "static const". This means, inevitable, that
every driver out there open codes something like this:

static const char * const supply_names[] = {
 "vcc", "vccl",
};

static int get_regulators(struct my_data *data)
{
  int i;

  data->supplies = devm_kzalloc(...)
  if (!data->supplies)
    return -ENOMEM;

  for (i = 0; i < ARRAY_SIZE(supply_names); i++)
    data->supplies[i].supply = supply_names[i];

  return devm_regulator_bulk_get(data->dev,
                                 ARRAY_SIZE(supply_names),
				 data->supplies);
}

Let's make this more convenient by doing providing a helper that does
the copy.

I have chosen to have the "const" input structure here be the exact
same structure as the normal one passed to
devm_regulator_bulk_get(). This is slightly inefficent since the input
data can't possibly have anything useful for "ret" or consumer and
thus we waste 8 bytes per structure. This seems an OK tradeoff for not
introducing an extra structure.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- ("Allow drivers to define their init data as const") new for v2.

 drivers/regulator/devres.c         | 28 ++++++++++++++++++++++++++++
 include/linux/regulator/consumer.h |  4 ++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/regulator/devres.c b/drivers/regulator/devres.c
index 9113233f41cd..32823a87fd40 100644
--- a/drivers/regulator/devres.c
+++ b/drivers/regulator/devres.c
@@ -166,6 +166,34 @@ int devm_regulator_bulk_get(struct device *dev, int num_consumers,
 }
 EXPORT_SYMBOL_GPL(devm_regulator_bulk_get);
 
+/**
+ * devm_regulator_bulk_get_const - devm_regulator_bulk_get() w/ const data
+ *
+ * @dev:           device to supply
+ * @num_consumers: number of consumers to register
+ * @in_consumers:  const configuration of consumers
+ * @out_consumers: in_consumers is copied here and this is passed to
+ *		   devm_regulator_bulk_get().
+ *
+ * This is a convenience function to allow bulk regulator configuration
+ * to be stored "static const" in files.
+ *
+ * Return: 0 on success, an errno on failure.
+ */
+int devm_regulator_bulk_get_const(struct device *dev, int num_consumers,
+				  const struct regulator_bulk_data *in_consumers,
+				  struct regulator_bulk_data **out_consumers)
+{
+	*out_consumers = devm_kmemdup(dev, in_consumers,
+				      num_consumers * sizeof(*in_consumers),
+				      GFP_KERNEL);
+	if (*out_consumers == NULL)
+		return -ENOMEM;
+
+	return devm_regulator_bulk_get(dev, num_consumers, *out_consumers);
+}
+EXPORT_SYMBOL_GPL(devm_regulator_bulk_get_const);
+
 static void devm_rdev_release(struct device *dev, void *res)
 {
 	regulator_unregister(*(struct regulator_dev **)res);
diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/consumer.h
index 5779f4466e62..bc6cda706d1f 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -244,6 +244,10 @@ int __must_check regulator_bulk_get(struct device *dev, int num_consumers,
 				    struct regulator_bulk_data *consumers);
 int __must_check devm_regulator_bulk_get(struct device *dev, int num_consumers,
 					 struct regulator_bulk_data *consumers);
+int __must_check devm_regulator_bulk_get_const(
+	struct device *dev, int num_consumers,
+	const struct regulator_bulk_data *in_consumers,
+	struct regulator_bulk_data **out_consumers);
 int __must_check regulator_bulk_enable(int num_consumers,
 				       struct regulator_bulk_data *consumers);
 int regulator_bulk_disable(int num_consumers,
-- 
2.37.1.359.gd136c6c3e2-goog

