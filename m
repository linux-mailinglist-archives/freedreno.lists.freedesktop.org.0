Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAFB8FB454
	for <lists+freedreno@lfdr.de>; Tue,  4 Jun 2024 15:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495F010E492;
	Tue,  4 Jun 2024 13:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="v5sx+023";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5443610E493
 for <freedreno@lists.freedesktop.org>; Tue,  4 Jun 2024 13:50:53 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4213870aafdso25175625e9.2
 for <freedreno@lists.freedesktop.org>; Tue, 04 Jun 2024 06:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1717509051; x=1718113851;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=A0z8y2KXgWMctf+4HNibjJ24MwvWsWDlBq67X1P0x7Q=;
 b=v5sx+023bzd3kiv5BKUJRH914QwSI0Zho4/S2WNAHpLIcwjT/+b5lt27Iis08m1RfJ
 M4ez0Ja2jRvJvU0cv8vwGBNsp1sebpuP0i+Hu+7FSCe9S5BnSBKkCE+hR0KbpkuCn7Xq
 GZyPNjIz7ktZbbfIqh0TPRym6OMTbMFwpBmTqfG9ngtYl61ml0Se9QBrBQm/HyMaJ5Oi
 SWBsKIxs5UXwCIgy+xQsXqtEfgszaJYBGP7dwbtQkxexTxr6HiZ3GuG1mU6nuI6mysR1
 NzsCGIGz3PQKCFUxHW0fHjdXIP9g3CnfCuyRrYS5PMnNRcb8kJ+MYVwfcG1luM8p+0Wi
 43og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717509051; x=1718113851;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A0z8y2KXgWMctf+4HNibjJ24MwvWsWDlBq67X1P0x7Q=;
 b=om7s1TvjoT/ikFAM+jGpFCd+elYmeiD/+wYeJD/Imn3ml3wLpjvmXnVZXMEsc/pSrv
 O8k9sgWfsUvY4/qq0gjM7XPR4FgRe0NLPkGl3Ih/mjmA3ZTp8gcfxZT75yRU02wsptkV
 IcjZUWP76d9RkMMeKtHrg32a1jy3KP8Uk1Xgh13Gq/7yOU84WHUNQdUtBi1e2uVV/lRj
 z0oASPmDb7rn2sxi6J3/w301ydy5JhmXWwRD1GTi89UWnyCn6K6lg6/2z9VZWaAElpje
 h/sxTDztRPB+cQECBWGMR1obWYLAnzLhqt5czuRGSCmTJDOfRaj2EvShlUwiPgNk1N7x
 mI5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlHzdwkFtZgSwua4WRg7GLifYDel+L2ZZhB+EI8i/uTrQi3GoOzrMkWLqcYH+1QCo8JLzj35Lkh6av4TDJzFJ5FGKPCK3w2uSUeM4yyDqg
X-Gm-Message-State: AOJu0YxtLygHgzs0qnonL4GQKo4SOuQ2TxvnqggJPNBEQ8wVs2fgdnWH
 rhKg2uQ1hKj+nrnMgnAGttQqV1p1UxUfUtQbSfIM/LgfHD+86KL5DovMxBajMdk=
X-Google-Smtp-Source: AGHT+IEc2+tqSTQ0+czKAp3EtUoJe7f/LGCfMvFWif4Jd/fuXiqh5Du825hPDJRf3RAhHkvuNgWcgw==
X-Received: by 2002:a05:600c:4f46:b0:41f:f32c:e097 with SMTP id
 5b1f17b1804b1-4212e0763ebmr92670415e9.23.1717509051469; 
 Tue, 04 Jun 2024 06:50:51 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42133227f8asm139569755e9.19.2024.06.04.06.50.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jun 2024 06:50:51 -0700 (PDT)
Message-ID: <c1f26026-dd53-4082-bb0b-c35db2d17fb7@freebox.fr>
Date: Tue, 4 Jun 2024 15:46:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/4] dt-bindings: display/msm: hdmi: add qcom, hdmi-phy-8998
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 MSM <linux-arm-msm@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 freedreno@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <a2cb1290-9e01-4136-9592-ce439b1096b6@freebox.fr>
Content-Language: en-US
In-Reply-To: <a2cb1290-9e01-4136-9592-ce439b1096b6@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

HDMI PHY block embedded in the APQ8098.

Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
index 83fe4b39b56f4..78607ee3e2e84 100644
--- a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
@@ -14,6 +14,7 @@ properties:
   compatible:
     enum:
       - qcom,hdmi-phy-8996
+      - qcom,hdmi-phy-8998
 
   reg:
     maxItems: 6
-- 
2.34.1

