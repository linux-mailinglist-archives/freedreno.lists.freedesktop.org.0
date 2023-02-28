Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACD16A583D
	for <lists+freedreno@lfdr.de>; Tue, 28 Feb 2023 12:34:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3CE410E053;
	Tue, 28 Feb 2023 11:33:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EECC10E693
 for <freedreno@lists.freedesktop.org>; Tue, 28 Feb 2023 11:33:51 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id bp25so12793830lfb.0
 for <freedreno@lists.freedesktop.org>; Tue, 28 Feb 2023 03:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wSIZDU9Jg/2Fu4qAh38NIaWYnR0lEE+twOi2NP/xMe0=;
 b=PnAiIz5fWMP+1y006x1EeT/Qwm4OHmdUE8UDBRmYFJLkLqTJYgB9YFJTCfBDGRlNd4
 b7AWrnoEQkxlvoshB1ujfVje4TrAgVozJFKnTi+FWhMasGBWUT5ON15cWS8qNS9dCwOU
 I9H57VVrCjGujBwmmJUDh7JWkEBli3IYNvOXCYG2AM6fIRMBWHbUbOzFd94KiIN9bhzt
 lwhHSWj4VCeee+K6+x2ah8oj0yApqunXtC0HmhQe4/yPg8eUea3JCZfTODKj9sR6UEpM
 liU4kCY0mM94H8rlgJH38a/EnNdpZv0vPjZifCmQRJ5vduP8obWBw4Ur3wjlcTXn8Pmg
 HGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wSIZDU9Jg/2Fu4qAh38NIaWYnR0lEE+twOi2NP/xMe0=;
 b=SPCnc1UOAzviwGhYfuQIg8HJJ2ozLAN0tXuzioHLXb7SDv81L0kTFxSaJy2ztviarx
 cxT+WMTin/drZnuDRfmh03E5/RAphphRSwCkqYcL4lX7/rsMdVrUBl0Pv8sAUetCZzLZ
 UC9uKTyFDS4EaTYfT90XpPbtBCBcchz/tE4fAgQpzbJxHeulBxi/u6VdKP8SJs1Fn83f
 hj/+q52BOUjCGxTiyjmwiaPu9pT6A+Eh5y7SXMfcmcIsqWbZH9/buyxWJstGckANk9T2
 itucAsB2eJJmIfdZbU/iCMXmqCgPl39lMTU9JS5+pBSPPgaCfv7NxRM8nVzXQddhPj8P
 XwmA==
X-Gm-Message-State: AO0yUKV2ADrTfOtUPV1OzrTNQ/SiCM6ywU4R9j5ifMq7VRbNegntoKXO
 2q62wys2BGrvcEprDXw5vSVFbg==
X-Google-Smtp-Source: AK7set/dVPeod/Y5g0V3qlSktTgR9klJIxxKsNCRFhi4Ez6EwJM3jqCnFflSDtAVMVV/pnpkGr/YIQ==
X-Received: by 2002:ac2:4425:0:b0:4db:3e7e:51d3 with SMTP id
 w5-20020ac24425000000b004db3e7e51d3mr535365lfl.55.1677584029457; 
 Tue, 28 Feb 2023 03:33:49 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 h20-20020ac25974000000b004dd0bbc89a1sm1288472lfp.244.2023.02.28.03.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 03:33:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Date: Tue, 28 Feb 2023 13:33:39 +0200
Message-Id: <20230228113342.2051425-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228113342.2051425-1-dmitry.baryshkov@linaro.org>
References: <20230228113342.2051425-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 07/10] drm/display/dsc: include the rest of
 pre-SCR parameters
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

DSC model contains pre-SCR RC parameters for other bpp/bpc combinations,
include them here for completeness.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dsc_helper.c | 72 ++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
index 51794b40526a..1612536014ea 100644
--- a/drivers/gpu/drm/display/drm_dsc_helper.c
+++ b/drivers/gpu/drm/display/drm_dsc_helper.c
@@ -327,6 +327,16 @@ struct rc_parameters_data {
 #define DSC_BPP(bpp)	((bpp) << 4)
 
 static const struct rc_parameters_data rc_parameters_pre_scr[] = {
+{ DSC_BPP(6), 8,
+	/* 6BPP/8BPC */
+	{ 683, 15, 6144, 3, 13, 11, 11, {
+		{ 0, 2, 0 }, { 1, 4, -2 }, { 3, 6, -2 }, { 4, 6, -4 },
+		{ 5, 7, -6 }, { 5, 7, -6 }, { 6, 7, -6 }, { 6, 8, -8 },
+		{ 7, 9, -8 }, { 8, 10, -10 }, { 9, 11, -10 }, { 10, 12, -12 },
+		{ 10, 13, -12 }, { 12, 14, -12 }, { 15, 15, -12 }
+		}
+	}
+},
 { DSC_BPP(8), 8,
 	/* 8BPP/8BPC */
 	{ 512, 12, 6144, 3, 12, 11, 11, {
@@ -362,6 +372,37 @@ static const struct rc_parameters_data rc_parameters_pre_scr[] = {
 		}
 	}
 },
+{ DSC_BPP(10), 8,
+	/* 10BPP/8BPC */
+	{ 410, 12, 5632, 3, 12, 11, 11, {
+		{ 0, 3, 2 }, { 0, 4, 0 }, { 1, 5, 0 }, { 2, 6, -2 },
+		{ 3, 7, -4 }, { 3, 7, -6 }, { 3, 7, -8 }, { 3, 8, -8 },
+		{ 3, 9, -8 }, { 3, 9, -10 }, { 5, 10, -10 }, { 5, 11, -10 },
+		{ 5, 12, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
+		}
+	}
+},
+{ DSC_BPP(10), 10,
+	/* 10BPP/10BPC */
+	{ 410, 12, 5632, 7, 16, 15, 15, {
+		{ 0, 7, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 6, 10, -2 },
+		{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
+		{ 7, 13, -8 }, { 7, 13, -10 }, { 9, 14, -10 }, { 9, 15, -10 },
+		{ 9, 16, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
+		}
+	}
+},
+{ DSC_BPP(10), 12,
+	/* 10BPP/12BPC */
+	{ 410, 12, 5632, 11, 20, 19, 19, {
+		{ 0, 11, 2 }, { 4, 12, 0 }, { 9, 13, 0 }, { 10, 14, -2 },
+		{ 11, 15, -4 }, { 11, 15, -6 }, { 11, 15, -8 }, { 11, 16, -8 },
+		{ 11, 17, -8 }, { 11, 17, -10 }, { 13, 18, -10 },
+		{ 13, 19, -10 }, { 13, 20, -12 }, { 15, 21, -12 },
+		{ 21, 23, -12 }
+		}
+	}
+},
 { DSC_BPP(12), 8,
 	/* 12BPP/8BPC */
 	{ 341, 15, 2048, 3, 12, 11, 11, {
@@ -393,6 +434,37 @@ static const struct rc_parameters_data rc_parameters_pre_scr[] = {
 		}
 	}
 },
+{ DSC_BPP(15), 8,
+	/* 15BPP/8BPC */
+	{ 273, 15, 2048, 3, 12, 11, 11, {
+		{ 0, 0, 10 }, { 0, 1, 8 }, { 0, 1, 6 }, { 0, 2, 4 },
+		{ 1, 2, 2 }, { 1, 3, 0 }, { 1, 4, -2 }, { 2, 4, -4 },
+		{ 3, 4, -6 }, { 3, 5, -8 }, { 4, 6, -10 }, { 5, 7, -10 },
+		{ 5, 8, -12 }, { 7, 13, -12 }, { 13, 15, -12 }
+		}
+	}
+},
+{ DSC_BPP(15), 10,
+	/* 15BPP/10BPC */
+	{ 273, 15, 2048, 7, 16, 15, 15, {
+		{ 0, 2, 10 }, { 2, 5, 8 }, { 3, 5, 6 }, { 4, 6, 4 },
+		{ 5, 6, 2 }, { 5, 7, 0 }, { 5, 8, -2 }, { 6, 8, -4 },
+		{ 7, 8, -6 }, { 7, 9, -8 }, { 8, 10, -10 }, { 9, 11, -10 },
+		{ 9, 12, -12 }, { 11, 17, -12 }, { 17, 19, -12 }
+		}
+	}
+},
+{ DSC_BPP(15), 12,
+	/* 15BPP/12BPC */
+	{ 273, 15, 2048, 11, 20, 19, 19, {
+		{ 0, 4, 10 }, { 2, 7, 8 }, { 4, 9, 6 }, { 6, 11, 4 },
+		{ 9, 11, 2 }, { 9, 11, 0 }, { 9, 12, -2 }, { 10, 12, -4 },
+		{ 11, 12, -6 }, { 11, 13, -8 }, { 12, 14, -10 },
+		{ 13, 15, -10 }, { 13, 16, -12 }, { 15, 21, -12 },
+		{ 21, 23, -12 }
+		}
+	}
+},
 { /* sentinel */ }
 };
 
-- 
2.39.2

