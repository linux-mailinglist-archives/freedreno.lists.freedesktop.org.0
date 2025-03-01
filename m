Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95348A4ADE2
	for <lists+freedreno@lfdr.de>; Sat,  1 Mar 2025 21:40:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5643A10E2CF;
	Sat,  1 Mar 2025 20:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VdZHNdxJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E5C10E2A2
 for <freedreno@lists.freedesktop.org>; Sat,  1 Mar 2025 20:39:57 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30737db1aa9so29916091fa.1
 for <freedreno@lists.freedesktop.org>; Sat, 01 Mar 2025 12:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740861596; x=1741466396; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lm0hqPFeMjlAJa0zmvxvNTEk2emtnpzkaRSrh6He2DY=;
 b=VdZHNdxJ2EczcadhqZhd+Ea5NCA5cpTmgn8084gpXzs5UMgkhZzaaeMDlZNeOTNrX1
 p1GL8qlLttPdhuz3OiVD77g9hQbN7BWZFHMfu3d8mKj59MwVMCHnZi51Ne8lLPriz+XD
 zASz1qbrSEsGRRNu3uzNET0ZmY+MCqb4A9qoC5jlQDztSresE/NYluok12vdgECBxOSk
 57p6U90E8cJc0wDDSn2uuEVLYS1rYPmBQiclgnxfVDZU3A6i+x1xzvAevsPl9MWy+/oF
 Voh3hEZy5A9BPgoj1LqwLOmCJmCjQ47PEH6GO4TrwfADCu7gBpdNG6qWH1BlxVgt+aI6
 GTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740861596; x=1741466396;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lm0hqPFeMjlAJa0zmvxvNTEk2emtnpzkaRSrh6He2DY=;
 b=ZgebE5XcOyHgpTlkr56YDDkzFaVGE7IkdprfqxNmvvUvW3Gggzo0q8lH92jnUMDZST
 ZBNt6R4v/PzPqKMFhHq6Y241YU/f0+NDynqKJdnJhOlejuWR0s56O3vCf0xLebs8MH0n
 FliskDcg7CDXy2UOa/U1qilMAr/N1aoWrrdFT5gEo5B7nsZT3m3xG8JL6K6lP6F+75T2
 e+Gtw8ffborPhGomj8bCYEeMmFBNnjkKaAjwYwCd3Esn6XiTitRwYFFrHVo7KQbgBO7p
 HUiusXPktM3W/LLZviMEvPqRgsNsErsNXk964+drVLOwJ9NqLMtVzDlSxtYdXx4PBhO3
 3QXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw6cd776MlvJh8X31UiSTgM7aWFAjgutyJPRdCI+AcvHlFhFov14I3wRL90qHiKINNJ9Aj1PMGsnE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyyo6HfdWIpPXhnyO9GtXg9lWVsPeOATpI5pIcMite3oM+kSQVQ
 tpsDrvRD7DLXMDUVUU2np97VvQl8/iGaiiSrHbGr5T+h8q85NZh3K58sIPVj5iI=
X-Gm-Gg: ASbGnctD72huNntp0zNWhvT2vJXhWWIlmOR73Y+BOkzp3MC1A0NlrsP3DzlpnaQZSjm
 6f7LsNbFs5V2yV3/67mIrSjAi8/pD8IRlglyPk+tS0Y/urtg9ZWDlIDMWe5+karJBuL+8+Dsqzi
 qy6vnY/zbxCkiSf9K7jZMWACelX0yx5fcIk3gsQLYvujnWZ2zFtZ09I38xN4JOslkpDDFyiJ3Bt
 di4mpSD0t/s/6ZWc2F5sYHDphQwVSGYrGoWOdo7n9hxuAfunDElyOkNr8LShISJJSmaeh56loKj
 paci2aoVvSkSUfq38RyjQSq1tTG/778pz3RSPEAr3oZkm0T8tlI3
X-Google-Smtp-Source: AGHT+IEmTXK0sA2OkUpupOigZVSjmXwjzqW3fKRIwNjJwyTslP6vQRr4qY7BVPOJdFvgcDcjK+gOIA==
X-Received: by 2002:a2e:b896:0:b0:302:1cdd:73c6 with SMTP id
 38308e7fff4ca-30b9326af9bmr30502271fa.20.1740861595853; 
 Sat, 01 Mar 2025 12:39:55 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30b931524efsm6668921fa.60.2025.03.01.12.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 12:39:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 01 Mar 2025 22:39:39 +0200
Subject: [PATCH RFC v2 4/7] drm/display: dp-aux-dev: use new DCPD access
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-drm-rework-dpcd-access-v2-4-4d92602fc7cd@linaro.org>
References: <20250301-drm-rework-dpcd-access-v2-0-4d92602fc7cd@linaro.org>
In-Reply-To: <20250301-drm-rework-dpcd-access-v2-0-4d92602fc7cd@linaro.org>
To: Lyude Paul <lyude@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1430;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=oiT3XieBMSIfrzEMIa7+tHW3r4Yaol9yvhPjl0hzeR0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnw3CQKEcLkja2c5fPc4XKGOP4nL47TK+u5bXfS
 KNn90N+yo2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8NwkAAKCRCLPIo+Aiko
 1UG6CACk3GBifF0q/szx7lNrtLDJrKctDw1YTztUYefU9Y3YIjzg+oBXe4rU31154ET5jAIQEhc
 vUr+oWgIA+hJOAmPNkXvYWBYhXOBMfO6jpjerRnGOTA3mArW7GX+cc1EckkIb+hVgai/PVo/g7o
 OAFQBhPJTA/A67N7ugFi/EqD+Irbp4Ya1yt6VKSkwftQLg5UjPDF4HqBDv9cfM3GFAKi19ageVt
 xGfPppiBwqlSMyq5AFXeuI49x4SSB1fayq9tjEvss07cQfWjtXK6VR7C5eFGXEmKvkA6REGiCra
 m1aBW/rjjQ/Km0TKrKP2ALBrLsxGnA9DkvZzmBAH4Bo9IJCq
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

Switch drm_dp_aux_dev.c to use new set of DPCD read / write helpers.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_aux_dev.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_aux_dev.c b/drivers/gpu/drm/display/drm_dp_aux_dev.c
index 29555b9f03c8c42681c17c4a01e74a966cf8611f..a31ab3f41efb71fd5f936c24ba5c3b8ebea68a5e 100644
--- a/drivers/gpu/drm/display/drm_dp_aux_dev.c
+++ b/drivers/gpu/drm/display/drm_dp_aux_dev.c
@@ -163,17 +163,16 @@ static ssize_t auxdev_read_iter(struct kiocb *iocb, struct iov_iter *to)
 			break;
 		}
 
-		res = drm_dp_dpcd_read(aux_dev->aux, pos, buf, todo);
-
+		res = drm_dp_dpcd_read_data(aux_dev->aux, pos, buf, todo);
 		if (res <= 0)
 			break;
 
-		if (copy_to_iter(buf, res, to) != res) {
+		if (copy_to_iter(buf, todo, to) != todo) {
 			res = -EFAULT;
 			break;
 		}
 
-		pos += res;
+		pos += todo;
 	}
 
 	if (pos != iocb->ki_pos)
@@ -211,12 +210,11 @@ static ssize_t auxdev_write_iter(struct kiocb *iocb, struct iov_iter *from)
 			break;
 		}
 
-		res = drm_dp_dpcd_write(aux_dev->aux, pos, buf, todo);
-
+		res = drm_dp_dpcd_write_data(aux_dev->aux, pos, buf, todo);
 		if (res <= 0)
 			break;
 
-		pos += res;
+		pos += todo;
 	}
 
 	if (pos != iocb->ki_pos)

-- 
2.39.5

