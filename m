Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCa2ES0Fq2nDZQEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 17:47:41 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C74C1225600
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 17:47:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840BF10EDC0;
	Fri,  6 Mar 2026 16:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mo8Nwd3M";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XD52MdX9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BFF810EDF3
 for <freedreno@lists.freedesktop.org>; Fri,  6 Mar 2026 16:47:38 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626FrAVW082788
 for <freedreno@lists.freedesktop.org>; Fri, 6 Mar 2026 16:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 h4ycaMV7nlSUQ5du4YcIwqCqGJ98D+lbtRqht+ED2K0=; b=Mo8Nwd3M4MIJKTJH
 gMRjuGDEY9pr/EtnflqEOJFHn5zQOokp2UUS00B8IUA32El4IZbjeKVe/17IQ0mD
 OF0VgTVl35aI685dBjmUWeEC/+wGbuBeffmfZIhhtamL0Ym0FJQPE2ioNOafJGuu
 95tsocTXyJ5CGh6+90m/qwrefFHYjDZ+a9vjkrZm1lsdNXyG6YMDeH97UKL3jfY6
 cgyTwb65lUP9pG666Fibfl9Ng91HlW4x49tvHlNE8TnWGv6u6Qm3rVJDD3zeOTuc
 woa+bCuzrCKt2TkNlK05Vz1e7YOg5kIlBWz54Z7YYWPASjT0ip1oSuuFqFIEP5q5
 rweDYw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv98hc13-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 16:47:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb4e37a796so5207142185a.2
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 08:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772815657; x=1773420457;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=h4ycaMV7nlSUQ5du4YcIwqCqGJ98D+lbtRqht+ED2K0=;
 b=XD52MdX94pWGPrDMx9H5WNnLZ98s9YUD8mqJj47MeVu5NQveGDpGm00Ha9lYm6KIIS
 sgpaeXcVoRAsyuRO2G0c/MDyK+wOERQbbdzzpwts1WlgBNAZkOBT/H1OJRrkjerTAjU+
 pUZjJdKbgmbq48UP4A6d309AV/hPZnRDtL4BIdxc1dfel2uCLvAFlE4XB6pAAdOgk7EX
 e+SX8j5N/m32rFCiIcrw272YqncE9nXOFhQx2jHv0JX97iBnFdh1R3MlLSDawyufUWEi
 pgII/BPNn9u3mR9v6H7Bp8wllhG6ltXy8qP/uQ7wb3V+ufOu/pAgmIbUvPVlWftAp0WZ
 NkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772815657; x=1773420457;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=h4ycaMV7nlSUQ5du4YcIwqCqGJ98D+lbtRqht+ED2K0=;
 b=ICV1WMA1HQujmOmDhM2z1p/jGoBuglawHRf4Hj2AObmGCaWPqo4DNUPF+PSCAXGC4z
 kBWYZ02anlOpPu+ShGpQDEjlIFRXRIv4byw0+T6b5/2BgkWZWOe0pCFgQoWAfj93X9/j
 p+ViTejiz6ZD3xqG32xHoMdG1lhp1jLnce2iLuUJ+ISvd9vxeP0oGU0y9OF8NOm7iF8j
 dkxvrQTr9D74mUNyjxSrXoE5H2IcY3YH+kEq0GtnUzE6NEGcWQSTopx9iLNGNrbnNn6C
 +ryd1bL6CY8BXOsICgiLwJuBXD91Q4rBxLAtZ7Eh6sE+v5q6td+pVmffDzMtRfrGFyem
 XtKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmj6LMvh4o2DWQ1csjZ+XCBpp3Js0bbx0GQraIwyEZ+78wS24MC2cRpPjkbashFAv2LuMi/4QPmV4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwH6iKBJ26Qg10nbXSyx68nEonmrKsWaojEmBFl08gIw6E4Bq+h
 yEooxOHj2aU0uikBIReV9Gwu+PELRD43YLIjqla8Wgar0aVo1rhT9wf9MGbvDKtGikivjtaIBKT
 FaMy1ySL01PpX2EhLQbErtoKbacRbC8exmFB3GLc5I6xSFHlrqMkbWfn9IgxkkE4HybSbvB4=
X-Gm-Gg: ATEYQzz65O8n4nnKNVdncD7R2f+mx5CYodJ+fWiIkn7+qfpPxo51JpwGUu1QeeFTyHG
 zVhuBxKD9gpiR5ncLx96Jf/fKjCOxRyIzLqz37kOpn93NBB3J19PS2UWGjtDxXQm/+fJtq6wm/H
 tB9fyi6D6B+Zx9HPqdlT4EjZhfVZus0AMPZC5CQFldNHlRMjpryyLVUjXrtnLsevOMRZzh6TiIk
 S6cDDR0lmkLW+gMADo82UPjbt/SJ6ZF5IwNropwKO4voAda8u5HU8M+HIhFpjONcwwciJCVy+kA
 CA9yAr3ozaGbdVkUOB9Gfr0bZ5CmTALgnTp+tv3WwBxc8ce3FnwwmJiHeXmT99jAzwNDqufXItm
 zb5i4dC1AzKHzcghyWYox8fXSYypgEH9/vaQRBC6o2SO8KMGwDq4/ycXlZx6TgM7CV1u0xW/tdx
 CocTGqP66BPl48k/vO6CuB/Thy3F77EhoX+yM=
X-Received: by 2002:a05:620a:29c3:b0:8cb:8a78:2cd1 with SMTP id
 af79cd13be357-8cd6d44199bmr345357585a.20.1772815657446; 
 Fri, 06 Mar 2026 08:47:37 -0800 (PST)
X-Received: by 2002:a05:620a:29c3:b0:8cb:8a78:2cd1 with SMTP id
 af79cd13be357-8cd6d44199bmr345353785a.20.1772815656971; 
 Fri, 06 Mar 2026 08:47:36 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:47:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:20 +0200
Subject: [PATCH 14/24] drm/msm/dpu: drop ubwc_dec_version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-14-9cfdff12f2bb@oss.qualcomm.com>
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
In-Reply-To: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1070;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hheiMl8VJ8rTRpyUKrTSw/T/7nX7ElA8etZcspaY4GU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUOe72d0ff8IYJr6eCZASzSx5JMmxu/GZKTO
 1j+DdC89oaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDgAKCRCLPIo+Aiko
 1TZRCACKEJlsDwLebkHT5WKmGXXP6U/u9hsEV4J60U2+TmsXK/aV+XiwJHwzs1I4E7yy5PVl9ny
 U+9WF4fLO2dsaHD25UhmwpzZ3tBbs831aoqZ/U1CUQsB0r9BzKWmmTuEWZD126W9UmqaJvwEW8d
 eIGjzAc8XPMHhTD5/8EtZeNWDAAP7Kqu2Zg42d7vSObGox0Tb4x0irCBRkjCI3huRV7PFuDOT+y
 A96mczQNmJ+Y2W16vL7u82ql87bQKRm/RX3e6PGEJEi9mGKxfL12n2yM+E0MbckaMRapt0BJ7bm
 AXVNaEahYhJ98K4LLbGsG1G/F+YDfZptgq9if1CaA4ngG7et
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: eA3KfZ8Wtgkn8y2V-sYY7Ezxi9Bbbxwt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfXyv7Jau3xei5D
 KPsFwPnZpreWDpdDBC8zGM2QTfIYkI9crwoQ7zW30ltw+p0ewWtowqMuG7MhvVSJrsHo6U0psnL
 hXL/d5ScLI8jUYofbHKUUgARc8/oMBbR34zI5favfbVX1aIvP4i+QWyj6DySCpKdwYBZylzWSZJ
 ZQjFLmaxwThkhw4GA5ENVMWQwgoPXK5RY+dzocH71kGAk8mPHAjl6s8GdUikidBX+rdAtzJGprx
 3oME3kctLr2cVuD4yNDAaq77GFMMGLYO2ZGiXOw/3uwrvNm5O5tDllOJQ9sKmIHwIbTCGtzzmI6
 5wPV2VR2EqsHU13r7K2Ah2re+2kF9zNme/YZeJXl+wdeBEAd8N9FUUIbIl52akm11eozq6vNI6n
 Wjuej4Uz0Grq8zwqxwDBT9p3N+mbscFZScjHIpfgnlVj1w803p3cdkABuGRvXURI/z4AmyQ6PAd
 d5411i9cFCat+3sWklw==
X-Authority-Analysis: v=2.4 cv=LbcxKzfi c=1 sm=1 tr=0 ts=69ab052a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=OFVxzADIxEWc22agC70A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: eA3KfZ8Wtgkn8y2V-sYY7Ezxi9Bbbxwt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060159
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
X-Rspamd-Queue-Id: C74C1225600
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:andersson@kernel.org,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Stop using ubwc_dec_version (the version of the UBWC block in the
display subsystem) for detecting the enablement of the UBWC. Use only
ubwc_enc_version, the version of the UBWC which we are setting up for.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 547d084f2944..f424be5ad82b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1718,8 +1718,7 @@ static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
 		uint32_t format, uint64_t modifier)
 {
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
-	bool has_no_ubwc = (dpu_kms->mdss->ubwc_enc_version == 0) &&
-			   (dpu_kms->mdss->ubwc_dec_version == 0);
+	bool has_no_ubwc = (dpu_kms->mdss->ubwc_enc_version == 0);
 
 	if (modifier == DRM_FORMAT_MOD_LINEAR)
 		return true;

-- 
2.47.3

