Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QG5NLL2FpWkeDAYAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Mon, 02 Mar 2026 13:42:37 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C401D8DF2
	for <lists+freedreno@lfdr.de>; Mon, 02 Mar 2026 13:42:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D1410E4CC;
	Mon,  2 Mar 2026 12:42:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DKfUUMmS";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KjV9F0sG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D49A10E4CB
 for <freedreno@lists.freedesktop.org>; Mon,  2 Mar 2026 12:42:34 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6229EmdD3630784
 for <freedreno@lists.freedesktop.org>; Mon, 2 Mar 2026 12:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HIKO5P6PmTvp8kuGDeHMIKG3uzkbrKKydli4TZkIbn8=; b=DKfUUMmSziS2BGL6
 xQKGtQDJ4BZgoC9mtoVksPB8R1C8a+kZmSosISUyr03TYtD1H6TR+jDUCi5D6+St
 FZyQkuUe4pENsKrtPKr/ISJYJGxlFuCFdPRuoUSneyGTSWwC+BXnDWnDRVCJFRKN
 LSE22BCWj/P3IuFoB+pp9MXOepk5IjVvbBsXPF+p+dG9JcQkCaXGeCcZ8LyKs7ek
 kj6rl74Q4AWg0CbGH67miBC9nI87Q9A2QIP72LA1cHnSXoA7g2Etjs9i5hzQ9w78
 hyxDGk9nvCFjEJgvGbM7vBsty1ZDvxHfc9YYHXW6EMekIiXefcs5MGvW4zfUvrhN
 QTz+mA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7rhrnup-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 02 Mar 2026 12:42:33 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-895375da74bso43424956d6.0
 for <freedreno@lists.freedesktop.org>; Mon, 02 Mar 2026 04:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772455353; x=1773060153;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HIKO5P6PmTvp8kuGDeHMIKG3uzkbrKKydli4TZkIbn8=;
 b=KjV9F0sGjAxmaqtOb5GE93SdXeMWY4iw/a1JpXw0t+X0iyiC97q4UeD0gdKeBffiSm
 0rmxUhCBcidqCT0bzcQtVM0q8eTxWfS2JnBSsJDIwoa+S3PGvYqy4QQIcAiGTnL6QXJe
 YshmmTuLCws7hGIkgQ6aqze1ZjIkS7j/ph9bYGKtsmc5ZJNVs0YEoubPYL6DKLhksY3k
 +u86HN5pD97wTWdVyU1EbhixIT99MlZuAVqSALr12T4+oXsbATvL/e5K59hDFr+/2fqf
 /aPlxTu/ED7V6g9AhFcOkSC4YWPtI2hotSo5X3Oy5RWc/zxhW9/wGw4hmR9NpVk5IbXU
 UcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772455353; x=1773060153;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HIKO5P6PmTvp8kuGDeHMIKG3uzkbrKKydli4TZkIbn8=;
 b=t6xdR9L5ya6AD7osDvPy4wgmt4KfFiyKbZ/uSr/M3uey/8odvMmU/o93UPKklzdcJk
 TTJBS8dZMkNwpltsIVHzi0t/7M+nzByZCLnMZRda3dKtv0ZFxIZzXZWhQFO3lnxRgfRn
 +jW/dwseeMXPV92IYFj4gb4zz0OTqKbk3otBvZK1W7zsjxJxlENTmH862WB7baJ3QpWc
 T+JTRGWb7feToB2AAOTpiy3r6sCfUTCWZGbFaVTqlrBKTp+L3EupAVWiuzDG3pAMN/Fu
 INbaj7IkYUx4WVMOpigSwwqBFbtodBgAHurs8Oqu1p0PbMBG9PfdgjBAy5dyjDJnX9JC
 xEHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJyGr5ZauYsO6Y+dTFcRF/Sdo3s4zsudHw+n0guS0s8/KYZpQeN6Y1Wkq1DriyoKkdVr64+OA7bi8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzetZfBUXuIU+laJMtRvJru5bXNoCnfhHwcVPAr9eNxa9YZDOG
 c9WFK4OFwLvTDf9Kup387YV+UcbQhW2AjlxMmQuiqJ5RQVhw4hOyzWjj5rfP9jJ/nT2Oomnatfv
 GTG15W4PStM1FJH+jzjofA8tsP6HG3MH+Mp8Cv0Kp73/AIomRVm3UP/vKWcV/U/P6Rkdt35o=
X-Gm-Gg: ATEYQzzJ7oGxBbzCy/DUcZ11zd6vQ7KQoRdVRFtbLn/NP/i2/VEbREOws6FpjwoQtiS
 RrqtdYLWm25zrNgaXbJUKIWn67bBhfWETZdZ/m9pHtMS9ENT33SgDxaLAK7svWXQZ3/QZ4TpgKk
 8b8Y4jqLBd2KXu6LDAO7wl0x4QSlAZZl+ISQBEc2EozatilZThhyHeoplDs7TAdySmUd0x7C7Nq
 YUIO9DCICrEahXpYKgfCJoGP5WoO//Nyq26AY2lgA88TDnUHhJkOtt9mUaJWkaslXVz2Wsmcpa1
 dON8WS48CZtpBiab9i+beucPjqOREgOuFWMCt7mWhIkhJGuoN7QkkIxkkjrLGDkL+dUMp/aGq/A
 +A5Phn70iw+cn6OA7ADjfanddIkmTczAgLY84UrnWie+vX1Y6lT8YAFOBe4JP6pj3Njg24Ft0FN
 dsdMw=
X-Received: by 2002:a05:6214:5e10:b0:899:555c:cb2a with SMTP id
 6a1803df08f44-899d1e5bb1dmr127337316d6.3.1772455352589; 
 Mon, 02 Mar 2026 04:42:32 -0800 (PST)
X-Received: by 2002:a05:6214:5e10:b0:899:555c:cb2a with SMTP id
 6a1803df08f44-899d1e5bb1dmr127337106d6.3.1772455352166; 
 Mon, 02 Mar 2026 04:42:32 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b935ae93357sm460111566b.48.2026.03.02.04.42.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 04:42:31 -0800 (PST)
Message-ID: <b1ce41c9-2532-45ac-a883-2de442188d3d@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:42:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] drm/msm/dpu: drop vbif_idx from WB configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
 <20260227-drop-vbif-nrt-v1-5-2b97d0438182@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-5-2b97d0438182@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 47q9krT4EzRncYAnMnfafu3Q0pw7D4Ym
X-Proofpoint-GUID: 47q9krT4EzRncYAnMnfafu3Q0pw7D4Ym
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwNiBTYWx0ZWRfXwNSH4S5Jtt3d
 eEns2LYjmGn8RnxRsBej4gRqkXlt0+puhwcnrGeMTzXO5kIvPs3BwUbPYED0WL9JFabg/jg08sX
 bqEKyS9iJLoaiABFEfVYNeiut16LNo4a/2LJWTXJJjD1nrXOJ7Td/AKBp4hIjQCzNpDrRsX2ccC
 4de5pG+M+sLBzPpAxhtyJXOG/ARaVolwE3Iyo29LG20zr8Qi+lXw7Qnce8wVndGNpa1xso4G5Qe
 Uk6mImWYMQXT4kqtPpo5y4l7uFeB2B0//3EP5PfY/9vVsjnaFnb4X5mwPOnQraqx7WP21mesHo/
 aiGY+xEyBxL+oUA0HyKAqPpiKPmu//YZJs2THPSuEj2AQuAnnKxWueNPP4BNHUah3R7pdoPFPSf
 7sDyrKzWdQ6Psg7aPKRKogqM9u/GQJ/M3EdvHNcEj9nFjWcEYCBcc2O0w76m4Vc1cTXhOO/MiRe
 ltvaazsppOjq1ElPb4g==
X-Authority-Analysis: v=2.4 cv=cLntc1eN c=1 sm=1 tr=0 ts=69a585b9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=TNk1r7c1s_7MY2k-MSMA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020106
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
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 31C401D8DF2
X-Rspamd-Action: no action

On 2/27/26 7:36 PM, Dmitry Baryshkov wrote:
> All MDP / DPU implementations except for MSM8996 use VBIF_RT (or the
> only VBIF) for WB2. Writeback on MSM8996 is not supported (nor planned
> to be supported). In order to simplify the driver, drop the field form
> the struct dpu_wb_cfg.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
