Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B94DB1F190
	for <lists+freedreno@lfdr.de>; Sat,  9 Aug 2025 02:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1FA10E204;
	Sat,  9 Aug 2025 00:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LV0hx5sa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 703CD10E992
 for <freedreno@lists.freedesktop.org>; Sat,  9 Aug 2025 00:35:51 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578HkT4K006539
 for <freedreno@lists.freedesktop.org>; Sat, 9 Aug 2025 00:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PiZ22avjMQ6yPSDZ6+PmnqKblqG/QInLtG55ppMw6bc=; b=LV0hx5sa7UOFHmvt
 K4N5be3m9douJyU9YeYoEbgSBnU50CLRN5ntDb/xiGsPfn8yJUGFBGERALz3hXDu
 IGN2WkM5Xum8J11P/Nrs/3PSjpOjNA2BSBi3RXmYsVqeM9p/CWd4gcoOGLAjTrF2
 2gFoRFtMx3nq1w+dzF7KRKwjhnzcwnViqADzwglvcdViQTZrko6SZvCcMIJVoIfU
 6FS/hbVwxSKUWuQlmlmbl79+IrcDP0vHoEpzVtr4hN3uvtFB5uE7XJ5mH6KwOoyY
 xw79v6+7V9wPXwP98nkt4cGc2e+lPJmhTNMJaEgJ4y/qTme13nhG8rkcznFptBGI
 ObMVHg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ddkkt5r2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 00:35:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3211b736a11so5555129a91.0
 for <freedreno@lists.freedesktop.org>; Fri, 08 Aug 2025 17:35:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754699749; x=1755304549;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PiZ22avjMQ6yPSDZ6+PmnqKblqG/QInLtG55ppMw6bc=;
 b=lwDwkQBMSalckRkaJQQgZkdQJLQ/x7mVA7Rl/zcqpUBejqIi92BVhwVOFXq4ryzQ2y
 vbn/lhJQQr1aaEnfImdwAAu4mKvR8qsaDZZGDy4A3/NiNqAqy2Ov/U+yzON7lT4EWif+
 av5Mogr8EQrYZbdS8QHpG4frK2Ay57DoF8ewX2iqfDVgG5Bq3nW3w9/0MlIExrWbRH7l
 BiLAiHtZzl4Qqjt3zjZM49ji/aNF+uXQVnliPWZJSg8AhW3kMjRnvvVNf/o2st4mp31d
 lsLWf4rFPCqDB5dtacrNLiaHauBXFkSwdonJ30FVcCfQEcRAPZLPehMdfjCGWmlj78fv
 Ho+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzPkuqyIR4QNC5+vtyL4MXf1jIm8RnN8x6Ot8jF8N7LZeHvXFkBtjBs502LmldcoxfxPc7Tmh1f/M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNHKmUZCqKHb16+NshGIFydm40kPC0IWN/OF3cxRUtMxYZqFmn
 O4k7zWylqySTt7Z7XGYb9GCoAbZxcaqKDVWyM1rl3tBEaEVOmhC3r83ynmB1rvCBOF/fK0GF/MA
 pHxCmdZZtE+s899FZvHOc3OZlP4lBJmtwNWelg0ZIh/r5opU/+/tqGvxly9iaLH8FfQaWHEc=
X-Gm-Gg: ASbGnctDNCj4lsAsWzNVzNKz4DuMfyG2R9qQgbsRs51UMsdNMtSXuL9fV82i+79Okcz
 MntGvhk7dwk5GhB6lwj9daQ547roU6FwC8V5h9q5RzwQa7b6d5q9FqFLkPFlHLtFtUfYc2eykb0
 C/vcwTbDBqTnelmevmGVd0L2xS6Lcx4tYvz+EUCSo1x7z9Gl+IbGFy6Xn4dc2mcAoO0CBfWNx6n
 DERXIQWR8ykdMNDpMsTj+SbVu5LvSbXUJV6HTIkTKFbhR4vqJ8hIP9ggQDtt+RxWV+3WEWSanq/
 E12eGU2rSziAYGrcE/lNW8bkxuVYP8k79NAt4IzhzQfeKch99t62E0GH+rlph98YqCj2RhUh6Ow
 /gD286HcypsR79NR35XVCDn5u
X-Received: by 2002:a17:902:cec8:b0:242:9bbc:6018 with SMTP id
 d9443c01a7336-242c2277f70mr67504795ad.56.1754699749324; 
 Fri, 08 Aug 2025 17:35:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRcmkdoPKn0Y/gtVgwKawEtn3XJx+wDXdjs6KbTeVW7Zyo7yLwrrGGpLbIydsVcXp/EeUE5w==
X-Received: by 2002:a17:902:cec8:b0:242:9bbc:6018 with SMTP id
 d9443c01a7336-242c2277f70mr67504525ad.56.1754699748876; 
 Fri, 08 Aug 2025 17:35:48 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef678dsm219865355ad.39.2025.08.08.17.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 17:35:48 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 08 Aug 2025 17:35:22 -0700
Subject: [PATCH v2 10/12] drm/msm/dp: Return early from atomic_enable() if
 cable is not connected
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-hpd-refactor-v2-10-7f4e1e741aa3@oss.qualcomm.com>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
In-Reply-To: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754699734; l=1258;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=4NtupbLbHXZJKW3LGWuziF6T3O+S2Clq0/ZFSk/f48A=;
 b=pzZTjzYITZ80tgTHFP+3PXCECEW+ccVzZNuZooIm+CrqIvDUL9LgrFJnwSPGcSTtpuU2/mngE
 3yJTVSVx8BHCAAqhjaPQm2i2nj4ByCXG0skte9RwSkKuNRukmpO0gIp
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA4MDA2NiBTYWx0ZWRfX0CqwdnPt2v0K
 b3qIPzXRG9tKpmdGiGO16iMank9+fKkBOuE/5S7qgsQREmN3Lzg3m4uaFD8+OQlXgFuQGZ1c6X2
 6QFMEpL26RVjRPkWqyYaBY3IxUF4zgdLz+M8+1PwXUl4hxg9h1zG9DY4MzkH+1FuuliLp47QNmw
 jxE+AMbNyr1nPlroslgUjsW+CP3wUAsI3qBIYupL8RcKiT9ecmnwtFmhfkecpe9wpdbeti4htWS
 /udz4/w13KmX9fm3F9eoeF4d59xj2PdcrBVT7evMwvoKWjschqKZE5e4DIaRrk2mU6LOvgT5tPW
 pLt07hS/eAvge6NgOcVg/rQqqMBEsbKoDMEM/xgO62ScSko+DJMM3qpP4/oMIr1isJlyCB8SSJk
 pbeJVB0r
X-Proofpoint-GUID: yzS7zAC1i3GOKhAdUqZ2uLAHrs8xHZf7
X-Proofpoint-ORIG-GUID: yzS7zAC1i3GOKhAdUqZ2uLAHrs8xHZf7
X-Authority-Analysis: v=2.4 cv=Xpv6OUF9 c=1 sm=1 tr=0 ts=689697e6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=C9iwNz8zScVtocZF6eoA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508080066
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

Replace the ST_MAINLINK_READY check here with a check for sink count.

Since atomic_check() fails if the link isn't ready, we technically don't
need a check against ST_MAINLINK_READY. The hpd_state should also never
really hit ST_DISPLAY_OFF since atomic_enable() shouldn't be called
twice in a row without an atomic_disable() in between.

That being said, it is possible for the cable to be disconnected after
atomic_check() but before atomic_enable(). So let's change this check to
guard against sink_count instead.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index dd3fdeaacc91..82f0b6bdbf39 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1444,7 +1444,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	}
 
 	hpd_state = msm_dp_display->hpd_state;
-	if (hpd_state != ST_DISPLAY_OFF && hpd_state != ST_MAINLINK_READY)
+	if (msm_dp_display->link->sink_count == 0)
 		return;
 
 	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);

-- 
2.50.1

