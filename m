Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B22D106E3
	for <lists+freedreno@lfdr.de>; Mon, 12 Jan 2026 04:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F07110E299;
	Mon, 12 Jan 2026 03:11:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kg1DY6AM";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ck7bNwGv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5CE10E2AD
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 03:11:46 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60BDMURM2488398
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 03:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rED9lwvork3PLMQ2f9ebapLwUohNxkXpM0yGp5P1L/4=; b=kg1DY6AMxLMNu2Vk
 y86WfTV+kTzAZ1DSgxFbOALuUHuAaDpQ40+cmHkQHOGqb0hMj3d5+zQw9z/pdRtL
 +BYSri6MXHy22jt8gnvO2M5HY5oJuSS+2iWDP3AC5qqSSK5xq1EpTNsWe2cnW+I6
 J1HrVAFsTSMAJnCP2Fjtoz97FX/TSiUBotC+OO0ngbmU6rpJU14DV7h+QQYqPM2s
 wEg0SjyB2ouN8j91l3eH+j/hLEXUONvV7/lpwJglD/lCoTtaFaKRjTbtfN+Wvlw+
 u+M1usmbVBnW5e2IWtiqZzbhJYfjIw7ww7YtLq0jP0H1j4GFikX2atSfxBulR2Lo
 81WGlw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkjvxty35-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 03:11:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b2e41884a0so1228950985a.1
 for <freedreno@lists.freedesktop.org>; Sun, 11 Jan 2026 19:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768187505; x=1768792305;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rED9lwvork3PLMQ2f9ebapLwUohNxkXpM0yGp5P1L/4=;
 b=ck7bNwGvB06ddLoOlFuT34eIGzUJ1XDh4zpL3ldeVcsafU8MGHpM8sgfahuVavn5/R
 kj1wa/tS8VDbmuAz5Mrc5t9wT+nqsvPhPIZNqy+9jEcwH7zsjXOCU38U4u/1l8MDV8Fs
 eBsFiyMXqt+P1zm76lgAyjN9iQvWyDuMPxtoSfQlFa8aJXbEw7MDg0ecsQUh5LAwXWlV
 RYyfoa5O6WMxdnYauAiUsEQIxDseNj2UI1APZuSbJa5ZCCQBSsv4Z+u1yaVQMId0+AO9
 HdF0WOP3YTJ5dY6EKPohdpc76z2htcviU44aImmOAQahVMG9yNUVe6dOIxth1pbKLpXN
 IgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768187505; x=1768792305;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rED9lwvork3PLMQ2f9ebapLwUohNxkXpM0yGp5P1L/4=;
 b=As69nRpj4EXFSF+3TDP9k6SdCCOe6L5T/4TG9kXhadqE9HKJlLQfyH8X6yZ6xVb5+l
 jtpwJTDczQ9nEQ0fKWxWXyQbc3UHsVjLqIwkM3yw/WzzIr31Y/uSoAQfR+omiuZJXItl
 J5bzi1GpqLv1j576n3QNbVypoSj6c2i4gAY75lFOHjGpDlwWE9nC1zxx0Qo5NThnFW5E
 vhX+UDz4KOPXN/Zwa3Nk8uQtc1z0vR7VRgoztLq/QcguPx9SijMB6oJiTXo3Vmd+kGU+
 R1roeCkQjayW+JF9fWEIL8mTnR8e+LVsoTX0GjYuuvG6liguRF0Qijat1U5v64HGUPSI
 tLyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWajgTML7KIuWFZhxPiTgpeRnvIQrSWN+LN/RV3BpilOsnDr6TEa3Gjx6yeQoW3sIsgwb6x4gsc5Lc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywp5c5rIO5omk8taH4NekmcGsEZkd4agqTULRpiSt4kC/qBCwkg
 95Swc660378VAxRR9XGc1hKCv+29vMViU23JmDEh+A9h6HDc2EjISRTLgcNSEkGChQ6r2VjnoVN
 QcepU+T/xEYY3NG3JXKYsq014gYTcfuBv090fd0zYOLtukE5v62X72Ex9l1+DLz/YDrk1uPc=
X-Gm-Gg: AY/fxX4/42c7qDZqj2J0wOs3s6IAg2yn1iFe47cDSpGGgVtHCzNtGUhcXiIE/h0KGe3
 +pWweAjzfdXxyhj51L/vrSRtBHxtsoyMg1HKooOina6ELmrSdfFf5tNdMbeKjc/4+ahWsJq7vcc
 jCwg1NxQlldt7M5jf4Wjlz+a+ZqUTZSTP5nxjeNzYkwHJpXXt5K9MGm05K4SVMfsd6MTPFBluvN
 /GyNzhpalSLD6t4qLpDQRXCoyV3kY0Q8gHoNrXA5LYZoNT8WRRsd1s8K+/cz1oeqrmVA+alBFPT
 gfAPKNBgDJzt4e7xeI5au4xjm0ttDEubcyFdb9xDi9dksK04FZMZfwqQ1FUY/hc2lCPvqYksYcE
 fl+M2Uurgs9HQNGdO3RvfcHFpu64/+9+n+tZuywJQ5Ot/OVDVjFLxwfgFitA0lQuScnFyNrR2fB
 Qp/dEYwzHoUuSQ+BwRJ2OxGuU=
X-Received: by 2002:a05:620a:28d4:b0:8a3:f8c2:5f03 with SMTP id
 af79cd13be357-8c389421df8mr2032902285a.83.1768187505091; 
 Sun, 11 Jan 2026 19:11:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFy2sOPSG9xnspRGe3S50DMCS9lvh724LPP3uuPnBxMoXPZql+DuoZXe5XMhxwVlt6UBPrypA==
X-Received: by 2002:a05:620a:28d4:b0:8a3:f8c2:5f03 with SMTP id
 af79cd13be357-8c389421df8mr2032872985a.83.1768187496172; 
 Sun, 11 Jan 2026 19:11:36 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b792cf330sm2758871e87.102.2026.01.11.19.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jan 2026 19:11:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 05:11:30 +0200
Subject: [PATCH v3 2/3] drm/msm/dpu: filter writeback modes using writeback
 maxlinewidth
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-max-mixer-width-v3-2-f98063ea21f5@oss.qualcomm.com>
References: <20260112-max-mixer-width-v3-0-f98063ea21f5@oss.qualcomm.com>
In-Reply-To: <20260112-max-mixer-width-v3-0-f98063ea21f5@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1546;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zHSRfRG/yEhgqLh6Odv+yciJer7YgF5rsUQscTWE1lE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZGZj86aFD68n5Ir9ySTR6r3+b7J6Z3y0AMQq5
 gzT7WbLmQKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWRmYwAKCRCLPIo+Aiko
 1VWSB/9aYazlDtkhbS00IerH0YtRm2wj0D6n62SQ0+t78++Kjfo0KnbLQUG6u4ToJVsSE1/uesR
 SiNSI4iPmBkLWk1/b5TteDZnWpXV+prZDGMOt+x1U6cDdcB0i6AnTeUB2z+mRt22PjYA+xBURlk
 xmQV3sDKQq1ckzDOTROXFDSUZ0heuHRZ1zL0oW49LDAEpdSwlo0AQZxGM4O+XjLqAopJrZ3Rmee
 wFiM4d3EAYgxcJY33rkSDohsk9V6oL8eFAR6xSo5QxyqOakPPdeOBoCLRW1v1wyI33tl9e7cDKV
 qijHaBSid8o2tyLDhR4QaUBuvypNXp/LrBaNGkYdy3xOoePM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Wrsm8Nfv c=1 sm=1 tr=0 ts=69646672 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=K26iOwrG_T4ePdtMxkgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: pwpgtV08PUnAH_WBs1ldI0bhAj84AhFc
X-Proofpoint-ORIG-GUID: pwpgtV08PUnAH_WBs1ldI0bhAj84AhFc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAyNCBTYWx0ZWRfX6xr8CbJEnLJE
 0tbprs/exixWuXbK2caQ0y3JayNFZzqK1CWKTfg6TQmRdhsqtWSbUcUEemMu2juSCn/1yZnDYDp
 LVM/IgdyCzFHnteMquh8N4gYUyr1o7Hb0ZipmYEwpPKeSu6OJoX6mKklPjvx4wsbc/ekD16WmmY
 CS5PiLmktNaTbQe+l2AajiBl9ZRZPoM8t6n/qvhlVno0UDnafsj5g1CILolrEskHwjxk9BvDlY8
 oKaMMlLlKKG3W5Nqit9OECLtsJ5YKJuuNRCEUA8pUTglRHvHAflZVHamte2dpEFC3kGej5OnZDv
 H8L/OveyRvi2l89OvkIqYU/czIN3QWW1R//JXH8WkVvAmSRiy+CQ9o6q5puJYxXWmY/oh25UxrF
 il+jRL06tGBs6oYsGOw21xnC1YeqT9BQHmVc1nNBDkHlcuV3ryUh8Ox9WxgFE7WPa9c8I8tJRum
 Mx+Z+3QpIHV7dih246A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120024
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

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Maximum width of the writeback mode is limited by the hardware buffer in
the WB block rather than by the LM properties (LM doesn't have an actual
buffer). Use the actual hardware limit (the writeback maxlinewidth) to
filter modes.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
[DB: fixed commit message]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index 7545c0293efb..209b1e27a84b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -14,14 +14,7 @@ static int dpu_wb_conn_get_modes(struct drm_connector *connector)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 
-	/*
-	 * We should ideally be limiting the modes only to the maxlinewidth but
-	 * on some chipsets this will allow even 4k modes to be added which will
-	 * fail the per SSPP bandwidth checks. So, till we have dual-SSPP support
-	 * and source split support added lets limit the modes based on max_mixer_width
-	 * as 4K modes can then be supported.
-	 */
-	return drm_add_modes_noedid(connector, dpu_kms->catalog->caps->max_mixer_width,
+	return drm_add_modes_noedid(connector, dpu_kms->catalog->wb->maxlinewidth,
 			dev->mode_config.max_height);
 }
 

-- 
2.47.3

