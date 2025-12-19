Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5270FCD0EE1
	for <lists+freedreno@lfdr.de>; Fri, 19 Dec 2025 17:41:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD84F10F04E;
	Fri, 19 Dec 2025 16:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="XWnQFMMo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC8710F041
 for <freedreno@lists.freedesktop.org>; Fri, 19 Dec 2025 16:41:22 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b73a9592fb8so405439066b.1
 for <freedreno@lists.freedesktop.org>; Fri, 19 Dec 2025 08:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1766162481; x=1766767281; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=O0HzFaVjwMvZjTaaJOfxP1smFpIabOwZw0I+saghW9I=;
 b=XWnQFMMoAIyYcPzw/pQxxI2zK9w21dY4I4WvMOhZ2EkubAEibsVty7vDXDeWeCKQMI
 xhyZicAvCc9ct/61Kns/oIjcYhRSPbx7yEX03JQgu1WLWztXq5GtybLPOeZGgmA5ZsiC
 QA5Tvhuypn7X7EXQWn8NPwFWNYdEsmLyJNMWbDIyp6yJ66PM17YYNzQXTXioA+H4d6OW
 7lo3VYaPfVPoyj0Xddq/eI0EBw35rPSKjUjxkz0ugoZf6Fm+q1QMu9JPjP7Bs3ttdJY7
 bzYgWJ4q5MLIoQIRvcBNBW0IkoG08a+2z8FwAHtp7he9MUKd0LE74OYA7zypP3vp6K0+
 qAog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766162481; x=1766767281;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=O0HzFaVjwMvZjTaaJOfxP1smFpIabOwZw0I+saghW9I=;
 b=QI1MLS0+9EYa/CsT7duQ3xVDAIaMwo2J7GB5IUhoI7OYst/aZ8VnbmmhGGJp6k4fsq
 I2T4E4t9nt9PgidJeTnkzOxpTe1FYryUcHoTn5XihPKHDsbe9gQMbF2F7h7EeyMyH3+a
 jKoZ6VDMxwDilyiL6eRuIDBT1Qs7IDOtLjkAB+j7wuLw1lQCCKXTk/kjJhdaQ9eTwCk0
 6NlOdhttA2+24CQ1YDMNfvAJCVRA29XweTGckCmCrEr7BCHoGN6Er/3zH8LuPzE6jBEx
 5LSQhjTef6k6yE9IHPqnVvQ2/cgrT5/NtPAaFwaWQslwPC2yBnnTo9vjmHlh9cz9j11G
 LgRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkinwIzLyzLpifIU/b4L4N5pIhPI8jIiRUVO2DIgGOdHdXpZXdN4wHi/CH2PE9UsMROEctR36TrAE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxV7Y9X1y8FPlTmYXa5xv7B9VUy4RKGkv1990wjRDhWuEFgy4ja
 5gy9xp473mAvhUMsVKdkiX2Ufpy8+4Tl5W7SXIcPM0QtFp8HJuRTBI1ci+Udi8fWDY4=
X-Gm-Gg: AY/fxX7Zq3qBcKe5j1z+dZVxhEEvNA72aTAGKS1D+m54rih7csiPCHmi/VG65aiIoc3
 6wtePmFWRgKRA4aXJQM7njpMG2lAzdd/E8lrBzSske0K3Q3dMDfI0IjqfpAB5pXN7WousUf0OlY
 SgDTWHz4KqzEdxXpuN3RtIf5hBBrYtzBmP/x8j1a2AdHJUXBxCyuKRr/5eHwKz0LV2gBQbKRyRO
 jE4YbLqbPsW1+sen+UIphk65xHOnq/OQypu5D4PhR1amy635eK6hwHUYn/xTjJDkdcMbULOcNZ0
 gY+frtaCc98BHN8tGcf0EY5H2nWUHhIKxdaLlqCbreRx3pGWonXWpc6pnreym6GFOQKvKS1tSto
 +WIs4N1jIdDI55Q/Vv0Y62AW6LFyvUst89Rxa5V7rF1LzyawSTpIz/pU3NS03QgV+bIHDDr3Gat
 6DFVFLjrlI+Ad6NRs8gpydYbXds9k3uLognKBYXycJX2CRhH0GxOfCUEMU6lUG0BI1LryGbzdv7
 DB49abCu5NtIuDrdo2RyyVCYpY1F2RbwHI=
X-Google-Smtp-Source: AGHT+IHWxjRwTQlRafEaSyCGoH5228OD0CyKH8COwa1Vo5glIpgVUvP069JTSjZ+iajU/yCWxg/e+Q==
X-Received: by 2002:a17:907:7e9f:b0:b80:16:850b with SMTP id
 a640c23a62f3a-b803542da8cmr453536766b.0.1766162481221; 
 Fri, 19 Dec 2025 08:41:21 -0800 (PST)
Received: from [192.168.178.182]
 (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:3b89:c600:71a4:84f:6409:1447])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f4ef1fsm270073866b.64.2025.12.19.08.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Dec 2025 08:41:20 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 19 Dec 2025 17:41:09 +0100
Subject: [PATCH RFC 3/6] drm/msm: mdss: Add Milos support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-milos-mdss-v1-3-4537a916bdf9@fairphone.com>
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
In-Reply-To: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766162477; l=1078;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=tR/wcXsSRSmMC9AuE79DxiyAbWm/TId46OBOFeIFTQM=;
 b=C/2rJj/g80rHDRnltiMZEOcEAploGDh4/PX6r35eRIe0loQrjOFjPL/YrpppAgkRC0l/xHDie
 gbCJGLNqIaUDU0TzwF33KUnK8+cnJflwNKYcC2qUTOOC7gLTx5KaxHG
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
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

Add support for MDSS on Milos.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2d0e3e784c04..aa63c079d730 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -535,6 +535,10 @@ static void mdss_remove(struct platform_device *pdev)
 	msm_mdss_destroy(mdss);
 }
 
+static const struct msm_mdss_data data_14k = {
+	.reg_bus_bw = 14000,
+};
+
 static const struct msm_mdss_data data_57k = {
 	.reg_bus_bw = 57000,
 };
@@ -553,6 +557,7 @@ static const struct msm_mdss_data data_153k6 = {
 
 static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
+	{ .compatible = "qcom,milos-mdss", .data = &data_14k },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &data_74k },

-- 
2.52.0

