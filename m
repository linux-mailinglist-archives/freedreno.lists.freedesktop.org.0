Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E48679EDBE0
	for <lists+freedreno@lfdr.de>; Thu, 12 Dec 2024 00:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F9510EC71;
	Wed, 11 Dec 2024 23:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="h3wBJZIE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39DBD10EC71
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 23:41:52 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-30219437e63so12838951fa.1
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 15:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733960510; x=1734565310; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BHlgw7iUBFM+rdSv9p/feyEV8lTt3noMeNdx9ahcPGs=;
 b=h3wBJZIE4DQl+kleae1XGfqsp3tCkeWR3v2NOYCpwQfRu8fDY/28cyIaIUHgtQBYKs
 fnLFbnhdA9jw7V8Iz/4iKWMjyi7erlC9zDasCcjlNByJm2LvRhgdJ1tOd7CLmUTgpXVk
 mUfN/E2f76M3cpRkIKLNnsMqqeFDGFlv5STlYLOq01iRzeU3fxe0l0tkmsSOwiL0VgOt
 EiDbU+TOyqU2w/1t9gPu7vhidzI7YJReeORQFxhe7ynB6EIbbg6FBka0KZ7D8tS5KU+M
 JNp+fzTOxM1lpwE9pFiSTSq6ZPy4ensaN9HoUYJDa14V62aVARofHirqlS+zFYJAyqgK
 Qq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733960510; x=1734565310;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BHlgw7iUBFM+rdSv9p/feyEV8lTt3noMeNdx9ahcPGs=;
 b=HEI6xP+0HECUqHYCil5j2W3h/kwlNybEoT9n3suAfQHSH7xGiIfPK+L90R63Ql+Cp4
 QaJ+CZ7v3IXc6ZgL26aN4yduwiONmQ+y6d5MZyOJKFu6OpkfNQXn9tgC7uwkLgsCsY9K
 BNUUr8N/OV13J4vLKxy1yZaeUxvmgZVWgX4tJY+2DUWHTs7+P2sE+Ek0//Znu2aHz14B
 jpCYUXKePotM7oU9cSUvNqQerTTbuudM4kn/3G/wzRBjqtpYYpFFcZMoj4I4wTwFaXq0
 3/CycSBn24RpW9y937ZQc91IGf2isD2XCGB3xUrPkZTAjJRXXoaC0asVRbU5WWMv8bnY
 4H4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZT41aadqsv/08EsugfPm7oofUu6bcwzGoeslM5iuk2cw/H3bZrBysR6WO9mmpF64PnXn5gCEOdgA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5P8IWjFFkTGpohGYvcXeWXn6BddOjCAUrxgAIoLSc7vmWQESy
 LIFh8YEjcFHoURlBWcPklIfHYNn1H7pdUxiRHOdZWLCdDrzT8zUS31xHqQ6Mowk=
X-Gm-Gg: ASbGncvHlPquTZIOneeZpZ34gksH2gqjXinrs61sGdXmuqXxJ1IRCAFVvh1vdSQFpUs
 lzFS8pb3owFUP1KTBZdcJQfMoSv4EEemt/1xreeZwf6pPZrTa72YwQo6SL6/DUBW3c0J4HMT2qu
 nNMu3lQCXGq17qQrjz6s1+Oe/nymHFT3+YUquFIHkXGuHHAmcgpclW4Sz2GsBFKd/m8JVAmqNl/
 fG9bVdCpV6nb3mbf0cRzdlAir4oCbApZVQ3Yn8+4yWM9DBgcw5XrcUIezkuoQ==
X-Google-Smtp-Source: AGHT+IGLZruVnHdmTYclHw1ZlfaHU0nRcZrow0QrWzRIjs7hRZq8O+mQVj9gR8FjZc9UdO1Ewapdug==
X-Received: by 2002:a05:6512:3b82:b0:540:1bc3:1061 with SMTP id
 2adb3069b0e04-5402f96533fmr370626e87.11.1733960510529; 
 Wed, 11 Dec 2024 15:41:50 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5401cc76909sm1222207e87.58.2024.12.11.15.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 15:41:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 12 Dec 2024 01:41:36 +0200
Subject: [PATCH v3 01/14] drm/msm/dp: set safe_to_exit_level before printing it
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-fd-dp-audio-fixup-v3-1-0b1c65e7dba3@linaro.org>
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
In-Reply-To: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1237;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=LBDq9dTy0DOxlRiv3jpt/Rd85VVmGCc+rFm7abUVNTU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnWiM3jCuKKj3zGknTJDllEMvmNanhKlf3tuvon
 j4/uxVgHdCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1ojNwAKCRCLPIo+Aiko
 1d/eB/4kyZzY6bSyBKDGs78I9tbZCJIBNlibHzxBEZECigDxPCoBpCmODNEfx8u3bMOVW/bqt2f
 zeyIIMf0+Z6cJt6tHApkIiF5A0SH6DHiPvAWI/SV4DYk0Q4s+VAX9TiWb/GzLYttjcYkxJyeWIk
 5U5UmUmrEWMf/dYpXYdpelPt16zrlNC+Z5kONm6YF4DKt0RLFxioEQbj9rwKFPPTnUrzwAY4HRg
 zaoO0x4oKx5fTU3zgmWlDPIFgeoSAADkg5sr1e4THD1Xpzex8uNt8Gj3cDQF68gCKKl6T8RHwDh
 bNkFAVSfOJHYd9dlfxpTRrHELiVYWOUQoljM9jckVPWaPeLL
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Rather than printing random garbage from stack and pretending that it is
the default safe_to_exit_level, set the variable beforehand.

Fixes: d13e36d7d222 ("drm/msm/dp: add audio support for Display Port on MSM")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202411081748.0PPL9MIj-lkp@intel.com/
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 74e01a5dd4195d5e0e04250663886f1116f25711..5cbb11986460d1e4ed1890bdf66d0913e013083c 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -329,10 +329,10 @@ static void msm_dp_audio_safe_to_exit_level(struct msm_dp_audio_private *audio)
 		safe_to_exit_level = 5;
 		break;
 	default:
+		safe_to_exit_level = 14;
 		drm_dbg_dp(audio->drm_dev,
 				"setting the default safe_to_exit_level = %u\n",
 				safe_to_exit_level);
-		safe_to_exit_level = 14;
 		break;
 	}
 

-- 
2.39.5

