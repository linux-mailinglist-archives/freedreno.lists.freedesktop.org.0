Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKloJUfkoWmUwwQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 27 Feb 2026 19:36:55 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D58E71BC0AE
	for <lists+freedreno@lfdr.de>; Fri, 27 Feb 2026 19:36:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A0810E126;
	Fri, 27 Feb 2026 18:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HpkKw+Pj";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jUdoKURD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591C210E126
 for <freedreno@lists.freedesktop.org>; Fri, 27 Feb 2026 18:36:52 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61RH0Rh6132232
 for <freedreno@lists.freedesktop.org>; Fri, 27 Feb 2026 18:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=CB9jX71PpJqF+vh9iq9cLa
 VFVWZdgK9XYLhA7xMJoBE=; b=HpkKw+PjW+36Epukk0N6Wiv7Dt/Q5BhBzCgRY0
 vv3Y9dpIAjYLUceimbRlZmmegPUOie6I9saVZZz1mIoUz3cQ9EJ9y88fNAFI2dJq
 EOBrcpH5LaidTYxQNeOetylS8UOkRwR0J3iq3JbmXLNMe30uHj/97nPEEyIlPjfK
 G/1XEOjs+q+Fh9FXVjzi2YhUfC+iZP41mQR6QLFlvZBwO7arpHGuTM+rkPrdnJgq
 03ntD+aq8N2GyNAOg6268/bVFLQi6K3v5/D3rh/Z7CPq/Qx5I+4ON9JVGcxqRf9D
 Y5DG6Iz2pdyX87LIxH31XhkfUOUuyWRowI/BFo/oUOTs74Qw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck43raqxq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 27 Feb 2026 18:36:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c70d16d5a9so1677175485a.3
 for <freedreno@lists.freedesktop.org>; Fri, 27 Feb 2026 10:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772217411; x=1772822211;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CB9jX71PpJqF+vh9iq9cLaVFVWZdgK9XYLhA7xMJoBE=;
 b=jUdoKURD2MIj2zRnRCRmeXdRwWy2lT8WK0/faZq36QEOJwpHexBwYAXZXBkgjwp48b
 zCAty+ABWg1qLcami3ARVsesu8GAbLyHqxSKcgRYIevuCpJ8rc+fpyKyEZq1VkPer6v4
 5+jUCG4AcIbB1pFKOs4snyZiCacWk5qAMArqhBIoMBIg+yq2sDK+UwOwdQL4dz/ptx3a
 4sKzawu4vZ/S8hs+/ZFkbGH80ZpSU/XWGzcht0BRq4w53ElbRgIsCxAfB9DGDE5DnI5c
 9ImNBnQ6zjZw75DW2bxjSiP/3rsO3JasbFosCib72epmtUXG1cXto9uZh5zbeDMkS25F
 nEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772217411; x=1772822211;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CB9jX71PpJqF+vh9iq9cLaVFVWZdgK9XYLhA7xMJoBE=;
 b=IlgxwVfi6XJamBMAFXueV2eVSfZSaMRzHM3uhqaVvOsT+s85q0j/aBibJV8F7XDr7k
 apfwi6ZSsTCw8SdpXItzSmrW7f4+DFYQ9JYPb8dO53KlyQ3m3m55HE7fszVRFW1dNK9K
 T2YS2ZkLdvOKWOdS+Tx56LvEJKt+SRQD820b7FE/TPBgrhaMdE+kUu7o9ItIUQJFmo9p
 7RDcPRv+8DTr133xzFdrwk03AF8nqtoL7Zlqz4O60+3lb5N+LsvPeirK/l6OZYPu2DgJ
 zjLvYeOGOF5YerXbXmQGT1jUht247Ijbd+cC2MlPdIkqDj3JCy1bWWIf66bWYvxg1l4f
 nZJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGR9Bo3yvthCZO5e64+YEWfx7XywsEAXY1wU5zgZb6BnAtFOy1DK/+uzX0jDlSDWFb4bM3nKQTFkY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwggbU3Y+SVo79UhCnnndCh951FHNQnJnpOQM1Ri00iusBKUzdR
 mbf9AN2i9RRPashDx4BTCgu0b0sykyy+ofG8rfomnk/7ENQSTeY7EtcIyPo4fe9QBhxyg5+IAUe
 dvUvOU9bfBzy1fK9FvexJWTrRTgRUgZHQ6elVeSkymy809LNMPI2YSPs9jJz9qZcyIye0mNQ=
X-Gm-Gg: ATEYQzzxs+LMo+t+Mc1Wm2PXzhY4iWzb7nA1tSbBerjrmYzXv5BoEAEIsFk8KyT1RfH
 gfnIVP38q83+fksioVkytXZcCZ/fDHyz/7HVtk8V0rGW0CPkxfOvxj+iBQ7Kk8a+q7P8oS7V/UD
 wHOBx93rbmUzExOAA9JdciLP1TN6Rs2OceJliCDHHb6UfmYYXzrnev4maD7rsAt1xbEPrgHmvt6
 M/VbuWyPLbBtUPVCisiA6gDck1Nz0FZyQexOUtXCx3Hw0/YBMPoj9n8B2QMuQYS3tl8sgvx9DKp
 +O4LZNkYJDXh0FMbtLkqsezM2XU8EXc5BTszZc9apGu+pkpEyIThXG3V6Wa/n+/Tedzrd41S3+K
 AHpCmxNoROTQArPTm3doDr/t1b/cFz01KJXJ129KUIur1SUU5v6FcYNzA4YlB2T5BchBuHTToDi
 sjgJ2vuUq24PoCNpnguytQS7cbZWU52nS9JcQ=
X-Received: by 2002:a05:620a:44cd:b0:8cb:62c3:3690 with SMTP id
 af79cd13be357-8cbc8d734cemr502725285a.13.1772217410678; 
 Fri, 27 Feb 2026 10:36:50 -0800 (PST)
X-Received: by 2002:a05:620a:44cd:b0:8cb:62c3:3690 with SMTP id
 af79cd13be357-8cbc8d734cemr502717385a.13.1772217408861; 
 Fri, 27 Feb 2026 10:36:48 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a115bca0e6sm117082e87.29.2026.02.27.10.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 10:36:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/7] drm/msm/dpu: simplify VBIF handling
Date: Fri, 27 Feb 2026 20:36:39 +0200
Message-Id: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADfkoWkC/x3MQQqAIBBA0avErBtQCaOuEi0yx5qNyhgRSHdPW
 r7F/xUKCVOBuasgdHPhFBt038F+bvEgZN8MRhmrjJ7QS8p4Ow4Y5cLdjX7Tkwo2DNCaLBT4+X/
 L+r4fpX0iB18AAAA=
X-Change-ID: 20260219-drop-vbif-nrt-cb7da190f6f4
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4303;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JAVhVbhVQlCqwSiAyvYiIJKF2fu3vIOqz6xoppA5iS4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpoeQ9WxlAWyJ4gaCXA2VS3F8Y+w2k7S0pIPJHU
 r6Y5z2vJdeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaHkPQAKCRCLPIo+Aiko
 1V0NB/9pGOLAft/TuUuE6MJPAQxftVZcFlhBWnUO02aTDnmgyq3uamXF05INx8RLzFFRl1WPLt2
 d5QN74IzmPipD/9BEUh7OUEYhWZtS9YweyXp86HVSNW6alH1x+nuuuyUX55EIhmZo8ivOlA9uq7
 fgPB+6n1V5G+50v5cY6jIMYGGl4wfHIgJk262jO8PFUCn/mUHCD0rSEQ5GcQD+EpnXYwlbX09LO
 CaEGEEu/X70x5Z2lBIiotB6LxTVJDzYSaJEa21xt3TcBndPjFHsdpcbWjdlmF3bikW4fpsJL4Ob
 TiQHvYzyyL3cVinclKppEAJmtPQfAqbfOxbc75fzPZvpp79j
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: hT5Fi8mqTM3PEBm5WdUO_IN0kPLyeHhJ
X-Proofpoint-GUID: hT5Fi8mqTM3PEBm5WdUO_IN0kPLyeHhJ
X-Authority-Analysis: v=2.4 cv=DOqCIiNb c=1 sm=1 tr=0 ts=69a1e443 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=T-p-S-tFZ4_u2FNYb-YA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE2NCBTYWx0ZWRfX0jGYw5u4v6PV
 IWdn1wqPTTvuMKVHpy4eprnua7zVPDvQycDyU4BNbvw5W5Lz8aoagmrcoN6JK7MH7CDMZsXtQLp
 unUGZIonYvIotJvCZ5sEOZA22jNfU4NkSOI9ZYPDdtB7hc+LVFKlFbavQEv6mt2hyAVwsy6qyUR
 /kxxai7sc3R/mJv20pcG98rm1oZLyM/s41sYJhyML+wGF3qokOqTn/iYhhocqkh7X29QLYBgLVc
 O1O7YXOnfNTE+kKTKKIzbwZng2jIAEy7pHAPayiGyMXoKjJYwLfZmxhdyRPXNpUrZEY3P73H8lj
 jAoMsbKHkEKen/NB494CkqbUSR+TVYlh9alE8SkZxQ4sc14j97KcmyFRGx8miy/BRCGPCLJyOsl
 rPvBvno+wJOzBu0TR1owhAVeqnkbB2tgr8tyakrhqLO8FVyAQQWsynI0ns89WKNVgLflLfvSiDm
 nInUaMg+Gbo+w3FFquQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270164
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D58E71BC0AE
X-Rspamd-Action: no action

Once Konrad asked, what is the use for VBIF_NRT. Answering to his
question revealed that it's not actually used by the DPU driver.

There are two VBIF interfaces two memory, VBIF_RT and VBIF_NRT with
VBIF_NRT being used only for the offscreen rotator, a separate block
performing writeback operation with the optional 90 degree rotation.
This block will require a separate isntance of the DPU driver, and it is
not supported at this point.

The only exception to that rule is MSM8996, where VBIF_NRT has also been
used for outputting all writeback data. The DPU driver don't support WB
on that platform and most likely will not in the close feature.

The missing features don't match the extra complexity required to
support two VBIF interfaces, so drop the second one and all the options
to support it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (7):
      drm/msm/dpu: drop VBIF_NRT handling
      drm/msm/dpu: stop declaring VBIFs as an array in catalog
      drm/msm/dpu: replace VBIF-related array with bare pointers
      drm/msm/dpu: drop VBIF id, base and name from the catalog
      drm/msm/dpu: drop vbif_idx from WB configuration
      drm/msm/dpu: drop VBIF index from the VBIF params
      drm/msm/dpu: drop VBIF index from the struct dpu_hw_vbif

 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h    |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h    |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |   3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |   3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |   3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |   3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |   3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |   4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h   |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |   4 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  35 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c        |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h        |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  70 +++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |  19 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c           | 163 ++++++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h           |   4 -
 44 files changed, 144 insertions(+), 296 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260219-drop-vbif-nrt-cb7da190f6f4

Best regards,
-- 
With best wishes
Dmitry

