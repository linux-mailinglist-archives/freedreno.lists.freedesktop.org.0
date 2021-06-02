Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB62239959D
	for <lists+freedreno@lfdr.de>; Wed,  2 Jun 2021 23:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F68A6EE74;
	Wed,  2 Jun 2021 21:53:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF806EE5E
 for <freedreno@lists.freedesktop.org>; Wed,  2 Jun 2021 21:53:01 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id z26so3289005pfj.5
 for <freedreno@lists.freedesktop.org>; Wed, 02 Jun 2021 14:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=35KIHc2zbuqTDDmHxLiGEjjkMvfweMiA7dOZFvgi+4Q=;
 b=LjLCPWyUJCv/nwUzKFfEIhyVhVfkxZ26x4S6/dHjpZfmu4UWHdiIykV7QdhTgyDSNk
 EhJsuQdjywMyc0patC9/YhnK4GAEKwXcWBH1k9VcGDPLLnGjo6s3g0NA4yxRRM2jwLtJ
 aOdBLSMDVdqFcVTlHqXB8ayK55NwWyV5sFYOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=35KIHc2zbuqTDDmHxLiGEjjkMvfweMiA7dOZFvgi+4Q=;
 b=PRTjfpiyJlDKHsl03pRayo+jPro0POnz3c4pEeKK/QRjlRvUsk18138PwZBaDmyLnQ
 FxzALemMD0Ks8cM2FjECrBbzl81BpSUa3fp0LNVB3Lnazhs6jOWnCVBi6N7Ia2/rO6Vp
 UNl2JEup6rKZ8V3tveXR+O4sdXISui8/z46yZr9u6m2TLt/s/UMntGQCjrN9Kzp+qpDj
 7GZPVY/DF3tmey/jRb4P2YK7iSQ+5Sg1FwKFqP5uu+w3QT1gQ1eU17OIyraRWOd3XGhw
 ckv1wpkVa5+PHJroQskNKq61hJseX/OQq1wWOkcPm6J7qdbo8r0LaKnsRf9YTN9ng6mi
 Yycw==
X-Gm-Message-State: AOAM533KmwP75MHOB1FFVoi4mjRB5OzDGy9XjEiD6JmU0VsvOLZKs7d6
 2L878w2znkOoxGCsqTBfM3zLDQ==
X-Google-Smtp-Source: ABdhPJyxg3ClKV30rkuhRaEjtEXoFLZP5PUk5uHwm06Hhq5bZhf8yYnj5RfUFCfEaRDEHlS+nL22Aw==
X-Received: by 2002:a62:7fc5:0:b029:2de:5813:8890 with SMTP id
 a188-20020a627fc50000b02902de58138890mr28955694pfd.60.1622670780709; 
 Wed, 02 Jun 2021 14:53:00 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id i2sm364203pjj.25.2021.06.02.14.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 14:52:59 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Dave Airlie <airlied@redhat.com>
Date: Wed,  2 Jun 2021 14:52:50 -0700
Message-Id: <20210602215252.695994-2-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210602215252.695994-1-keescook@chromium.org>
References: <20210602215252.695994-1-keescook@chromium.org>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=331c9dbab9265663d4598c7d5fe5739206ff6d5a;
 i=Fc5wke0Q0f+i/yxn94DGR+5HIU9duCLMgabBT2xqE4s=;
 m=wFfctFfoMi2zK6PlZHUypYp3tGHtf9WefM0kh+Zb8ng=;
 p=2mlWRMfcN4+QsvDCUI3dA5+oKnCQumRrgTAwchW8Ges=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026;
 b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAmC3/bMACgkQiXL039xtwCbhEg/+Imd
 0I18ddKDJ9AiCRaG4Zm1BLowuBeI2IKKfqbSeXmJVztPyaBSLkLUiCIzM3MraBgl3w6HXFulytfW2
 nep/TIf/0nf4qsDdCuOEnaBb8hWd04D8gGmQfqmrvTcIXv1RFcvb0io3fZbESdDpGrEKC5Cathvfg
 mKqvE4wkTDCtAiGjlK3mb5httl3x0WSV9StwVD26pfFgqDnVNfpxzbqVYfsEfDslKlpQaqLpqoOhq
 WtU4Dct+QHtYkk4kTSZ+xZIAL0POqSf/2kIYYII/N4dlF5sc9SIdUjsfUEO+OlYboBiabk1sGEyzN
 qjh6zeiMPt5Gp8cH57QRixWB/UIOhDwgKq5jVkMC5Qev4r93gj19EjjHKEVThWtrJW1uXmfgfgRmS
 4pO5aXWdh6U6EdFrG3/h/hfqHxxBc7zBjUPkli5zHNEvLYVodijf/wWXHAIZ+V1LAk2811KyASnSc
 fHv6akvRK//nNX4CYCb+suSdUD79IzDdK0UtBj4f9k2+aZZZddlhraBwEbSRNUPjGUnYJ20xGI2Hu
 HV7uZiw7qFYjJFzyvxzgQEZNLcYb8VMYigUHPc+8XdMiICDvqC3PH/+ZQBT0NvAJrUb8Af1FZJa4d
 EQE+6ZRFjC0Hq5YzPHOoIpnJEPHz6KwlwcRmXWI/3q6u1VHLg7D5d8J0B8fzkQjM=
Subject: [Freedreno] [PATCH 1/3] drm: Avoid circular dependencies for
 CONFIG_FB
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
Cc: Arnd Bergmann <arnd@kernel.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Kees Cook <keescook@chromium.org>, Emma Anholt <emma@anholt.net>,
 Rob Herring <robh@kernel.org>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Sharat Masetty <smasetty@codeaurora.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Linus Walleij <linus.walleij@linaro.org>,
 kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

When cleaning up other drm config dependencies, it is too easy to create
larger problems. Instead, mark CONFIG_FB as a "depends":

drivers/gpu/drm/Kconfig:74:error: recursive dependency detected!

Suggested-by: Arnd Bergmann <arnd@kernel.org>
Link: https://lore.kernel.org/lkml/CAK8P3a3jUQs6c5tESSNMbqfuymewj9FhqRizyHcfOXf8Rgy-nA@mail.gmail.com/
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 3c16bd1afd87..90891284ccec 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -83,7 +83,7 @@ config DRM_KMS_HELPER
 config DRM_KMS_FB_HELPER
 	bool
 	depends on DRM_KMS_HELPER
-	select FB
+	depends on FB
 	select FRAMEBUFFER_CONSOLE if !EXPERT
 	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
 	select FB_SYS_FOPS
-- 
2.25.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
