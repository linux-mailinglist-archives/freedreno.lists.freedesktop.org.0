Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBBrJ+uEpWkeDAYAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Mon, 02 Mar 2026 13:39:07 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0090C1D8C8A
	for <lists+freedreno@lfdr.de>; Mon, 02 Mar 2026 13:39:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1AC10E4C1;
	Mon,  2 Mar 2026 12:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zjf409ld";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dlfT9g+U";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931BB10E4C1
 for <freedreno@lists.freedesktop.org>; Mon,  2 Mar 2026 12:39:04 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6226h9Ap2504590
 for <freedreno@lists.freedesktop.org>; Mon, 2 Mar 2026 12:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eQna04IhPNINhdUa/X4UZuWsEJV5qIs3HUGMu8ECfb8=; b=Zjf409ldqsN5tiwF
 foHlYNVcL7NHrdBHqoaIT9TslddQSfOcc6B7qiuOXq4pN3E7WPBgW7M9WWei38z/
 7KCJWrmlkL99t9K59J6GmvDwc3qZjRM86XOy9+PVtDS2tdvMsDXM4VHFTb9fIQJx
 GISpnaGJyYrLzY2qfKlrk+wYLCdnJaiosP6sWDbrrUe+FiJRAhofImR521QxTnua
 jyB88tzboBDyLFeo5FaxFnR4g+NaXrNeYthNnETTKk1oi3d0/bZeOAZ1MYDxy1fc
 hagtWeRCqK4CyM95baWvLNgE/vXFl+AcSGMRdzFhhxnEy66OwKofbnfSxaBZOMpR
 5ErYlQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn5hes894-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 02 Mar 2026 12:39:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb5a76f13eso313138185a.2
 for <freedreno@lists.freedesktop.org>; Mon, 02 Mar 2026 04:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772455143; x=1773059943;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eQna04IhPNINhdUa/X4UZuWsEJV5qIs3HUGMu8ECfb8=;
 b=dlfT9g+UfjD2fEBQlIUIZ2US14zC6mrGARQzkZ0KiAKrN51bmdUYs7tEbsJTG1mfNM
 usxZ56irtxxVt+dz+v9iRxA1HZ4a6mlm6MON1BuOhU62o1nDRdfn3KEg45GkkMV3PKN7
 UbiHQbCFcgoq71uwUM+R4fzBEWndS1zOGQ3dlRYb+2DiPWMqIDoo0jyXqmOrwmGyLddw
 DsPrSsrtSJSDzghNdEI7KIgQKAKnKiIlsy7ZZtQ/PoIUf2JQc3WpCaXaxMvYbEgsOjfT
 L7qW+DyNzhEXpymoLBUDgBqmeBnWk8XNcBqrKeBt4ZRYDjr4Kz07dGTbaNhM7yJS/sVM
 RVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772455143; x=1773059943;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eQna04IhPNINhdUa/X4UZuWsEJV5qIs3HUGMu8ECfb8=;
 b=t5U2Qv8sJnnSIeodBzosSGQeQ1GbIH/Fmp5l4j5vqfWn6mH44Wow0NsrbaSIwdSHjH
 iKdr+sCJR8JWTMuq2SeBy/jRpGiWhYxPItQnTq6nLgOneojRstdoMoQCxvwbe+vaym/l
 1GFPYo9VKEA8jUh/X1XMjdTUlE9qJPH9Yr3rONC+YJJvY8eym2hsczxsEoUuA8r4ogoH
 iZYm0LsWl/Na2LC7TqcGogG1GX1SvvYmDqRF1/5a6Amz+PUPnwYC0Gb1uIyvvfsRUA7e
 Zc6rxgwZdW3isyq2ORRh/R2Gvp+sIZCZAizKZwiPD5/+jlywtFOrXSpn38Tfgyi/pnzn
 +pLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOFgb4/nlGCuEEUUROfV8Y6MxREm8TBTdspU+mz1I7T/1E6dk2D28dKtEZN3OnJO9snqmgnI2nKN0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7oykcFvWOqn0DuCrtT/hhywQo9hfrj2KaMRjn9JIStnd44VgZ
 XfyoDiJidCJm42QzIW+zPFSvtc0cxuvfwpv33cJstKdpGvT5l0RSgreOnzpKJINZ1TFJK86szI9
 Zua1rb1i+z8VeOqj8i0Rk9yyUVYum735E8TrgFGFqfB76/3pxbtXiC5i9Hu0t4TGkzmQy0SMw4G
 m//YM=
X-Gm-Gg: ATEYQzxx1Wxy825cuUuaXIlU1RSf+BMxCn5m9gqLFkF8jNF0z+eybbWE4QOXjULYsQM
 U+VnfA2TDDztENWrookzvUvUMKXEBV15eA5PxXKRMliylyWsVm1HD5q5n0IlfwUmaX/tM8dtvAB
 SO65EFkORTT4rwohHmT3WEEEeDFNAHsXcps29LCTAGRjjkZgPQeZEmr523sFNR2fFsVSqPPLZrF
 BMiKg8fKWv7SBOjPtsfUfCBPVlrW1kSYIUwKel45oSKMeQuZ6cALRCdn8MISFBaaOzlzurLrA8P
 OkvjfBBUQuSTAyr/DZaQ4gehbigyBhyY8DPszGtmcmV/QRp2xG6DTRtLbIGg0ldbkSnvGUsLCgB
 j+lrEucUgQOxa+yS1vGO9NHdr04Z6lOD6HRIWkhFAAdcXXu9Zy9KK+NxQ0Rh4bBXg9i3xGIGOdO
 H7UyA=
X-Received: by 2002:a05:620a:1712:b0:8c5:3892:a554 with SMTP id
 af79cd13be357-8cbc8dd163emr1221191385a.3.1772455142921; 
 Mon, 02 Mar 2026 04:39:02 -0800 (PST)
X-Received: by 2002:a05:620a:1712:b0:8c5:3892:a554 with SMTP id
 af79cd13be357-8cbc8dd163emr1221189085a.3.1772455142347; 
 Mon, 02 Mar 2026 04:39:02 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b935ae613ddsm465043166b.33.2026.03.02.04.39.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 04:39:01 -0800 (PST)
Message-ID: <136fb7f5-6574-475a-b30f-e5770abfd51a@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:38:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] drm/msm/dpu: stop declaring VBIFs as an array in
 catalog
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
 <20260227-drop-vbif-nrt-v1-2-2b97d0438182@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-2-2b97d0438182@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BI++bVQG c=1 sm=1 tr=0 ts=69a584e8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=xtCnSr9B5oVFkYUcn1YA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ZbVe2qK-5T69SeyrbP4VJrr897VQm8qu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwNiBTYWx0ZWRfX5cCgDAuvuh6F
 RBStzS+ekKLIDD9o+Vp9pZvn/q+LlwhVJl6g1tX6SKMi901ZYJAwf361/TsD0wEJskCiGi3bzln
 DI/n2gRzMT5AXb1FoHY/m/81JUrWDLUPXAk/NdDtrTCvce9yiejB3dmdv1H8R1EZrEPJerrZGgI
 LMFifmK3Fjcky+QUVbSXYhTu6G+8aY7EROutHtjrAWDdyaPu4vP2QLQdvZyjHS51VSmoBNub1Ur
 wb9P9/z/sSz/VxjtqC8Bz9bbtexxHLcQhMqr0S7VtvTEcs4DPKfpxG7JiPV7ND3AU2DDNT37HyL
 w9bO7oyo/OJbDaWrH5A7Rnm7uYg/LbGao9trPLApkw54yjcRfwTdlyEWcv32EYVybjG1xKSUe71
 pM+3otkZmpAMxJxS9Y49jFR4KJSeI4oA262YMTy0ZlRQmTZwSkdaIA6pcB5P1ALOpxdsZmu7zLy
 Gq2qqQ6pPt2/QqScjWg==
X-Proofpoint-ORIG-GUID: ZbVe2qK-5T69SeyrbP4VJrr897VQm8qu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0090C1D8C8A
X-Rspamd-Action: no action

On 2/27/26 7:36 PM, Dmitry Baryshkov wrote:
> The driver handles a single VBIF instance, VBIF_RT. Stop declaring VBIFs
> as an array in the DPU hardware catalog.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
