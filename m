Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B297990785A
	for <lists+freedreno@lfdr.de>; Thu, 13 Jun 2024 18:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E82D10EAEE;
	Thu, 13 Jun 2024 16:34:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="A2LB5mqe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113CF10E0C8
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jun 2024 16:34:01 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ec002caf3eso19590101fa.1
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jun 2024 09:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718296439; x=1718901239; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zHgrY4xIc9CPVKKUbUHFPFlrW7UpxJwbiRlbNkc9MGM=;
 b=A2LB5mqeNjTPyz1ri4MtE1hQlAzuEot/ooB03EJ+VLPde98qMPbLkPpjqR371Ur5wK
 IkQxXV4Hbm0PiNvT5A016r1zQV34QyJDNhC5HpvQ/ouddS8qUzFkvfUUzAf4Q36pO42U
 ec0eUfQ9ralDSz3k1NpRnjvE2Jh3FRJbWLefnBIuW0nY6kJb33kGNc1AfRS5VOSCfifF
 v58EfLO/dytZu7lcf3wSBq2tv9aScqUSZ6JRbM4hioFo3eUpHDRhzTBWMfc2wgUhlxBB
 Z3ffRMrobAlk+cMQ2Kaj2ghzzhz1fC7QahPnqgMG+jnDvyUZ+lC9bTySrtHOSzu3ToXB
 bSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718296439; x=1718901239;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zHgrY4xIc9CPVKKUbUHFPFlrW7UpxJwbiRlbNkc9MGM=;
 b=usi6CGv53ezQvcxYbIsAahTvMsIkDoHEBZCQ/ajZq8u2rOWmhvT8Ag/SFn+n7rzaCm
 nV1COmeaFpAg13h6NRd0ce4c3740BIhjmoc683gPoXV8snUhq24AyaCdeNtYY3qHFHks
 vt8QUoS7Uh4G2MX3PjXku5Az60fbZts+kiUarNsNQ9lcPaXFJLJ5GP9DJDraimF2JmvS
 pYoneP+LIKEeVclLupHRh8EgG3jwldFXalfF941/cccUke0zVVk5JFM4MOSu9txyVC1S
 exIdULONXAELAiBEhA02JnVB400d9zk//u3Ev6fDhygDgNfJJLWe/L7BwUf+WUJqyz52
 N93A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwgfgNkm4FfIdkk9u8vf/J4Ce0+ricztKbI6Xz4mosIch9naWsc1q3fefLqoKUNsvVn2oQqv9ZIpBkTHOHtVpQW85eKz6xcism1V0GcOuC
X-Gm-Message-State: AOJu0Yy4+ilMrO0rqFOQKLIPzXhgxt1Lr54laXMAiaA10NTqjphwBi26
 Yd/gnlQi2S2O4mTPW2kqejs2ONl1nz6O+CP7aTgMdVQTHScOOtr5FNPauwCfSZE=
X-Google-Smtp-Source: AGHT+IHQjwGnyIBB6w17aMs8YaOjxovU+qzoNkHKK0oqzTbPn4+mi5cAWSa9lQLAGg4Hgz05mK53Qw==
X-Received: by 2002:a2e:9943:0:b0:2eb:eb82:4112 with SMTP id
 38308e7fff4ca-2ec0e4826dbmr2994861fa.17.1718296438829; 
 Thu, 13 Jun 2024 09:33:58 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c9ae70sm3005621fa.133.2024.06.13.09.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 09:33:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jun 2024 19:33:57 +0300
Subject: [PATCH] drm/ci: mark kms_addfb_basic@addfb25-bad-modifier as
 passing on msm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240613-msm-pass-addfb25-bad-modifier-v1-1-23c556e96c8a@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHQfa2YC/x3MwQqDMAwA0F+RnBdoOxX0V8YObZNqDq3SwBCk/
 77i8V3eDcpVWGEdbqj8E5WjdNjXAHH3ZWMU6gZn3Ghm+8asGU+vip4oBTdh8IT5IEnCFeM420R
 LNC4E6MdZOcn1/J9va3+GH6EdbwAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Helen Koike <helen.koike@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1692;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=9Oy2rhgmMbROnThGOyXo7UyCu8RbyWradi7uQ/YWriE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmax91DGbuj22LlXzjIrZ3rzJ7TcRR5ZnaZlaZv
 xDd47ibag+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmsfdQAKCRCLPIo+Aiko
 1ZRyCACHj5FwfHDMFnICBk6c9bsSibSfFyyQ7foUfaKd0HdH7hkKubcXTIzpfHkQyAnGxQfjHc/
 aqZ1VduL+GHVFdJBw/CZ8pL8YipTrpHrMGaI+vwxGutamsp21f9+8vZv27yn6BgIXzQtDckQd3+
 fWMKZfI0oNHZAKvea59SaFEqG10Q/9x7+yPwkMOLaLgeWU7i8LZVPLHXZ5BsGHt3sq/r5sFFeZf
 1v1NfNOppwJchUxn+3cWWw+lK/S5VNtwBKGC45xchIr/gIfvtKiqFsAw36C41urnMETEhTVGhD1
 aXUxik06RCS2hjyYgJdOTQSRVkM5GgimG0wIZm1P5MTnxcJq
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

The commit b228501ff183 ("drm/msm: merge dpu format database to MDP
formats") made get_format take modifiers into account. This makes
kms_addfb_basic@addfb25-bad-modifier pass on MDP4 and MDP5 platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt | 1 -
 drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
index 3dfbabdf905e..6e7fd1ccd1e3 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
@@ -4,7 +4,6 @@ device_reset@unbind-cold-reset-rebind,Fail
 device_reset@unbind-reset-rebind,Fail
 dumb_buffer@invalid-bpp,Fail
 kms_3d,Fail
-kms_addfb_basic@addfb25-bad-modifier,Fail
 kms_cursor_legacy@forked-move,Fail
 kms_cursor_legacy@single-bo,Fail
 kms_cursor_legacy@torture-bo,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
index 23a5f6f9097f..46ca69ce2ffe 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
@@ -4,6 +4,5 @@ device_reset@unbind-cold-reset-rebind,Fail
 device_reset@unbind-reset-rebind,Fail
 dumb_buffer@invalid-bpp,Fail
 kms_3d,Fail
-kms_addfb_basic@addfb25-bad-modifier,Fail
 kms_lease@lease-uevent,Fail
 tools_test@tools_test,Fail

---
base-commit: 6b4468b0c6ba37a16795da567b58dc80bc7fb439
change-id: 20240613-msm-pass-addfb25-bad-modifier-c461fd9c02bb

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

