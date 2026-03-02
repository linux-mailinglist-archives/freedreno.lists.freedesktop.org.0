Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QM+sFnuGpWn4DAYAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Mon, 02 Mar 2026 13:45:47 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD581D8F78
	for <lists+freedreno@lfdr.de>; Mon, 02 Mar 2026 13:45:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C9610E4D5;
	Mon,  2 Mar 2026 12:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="npojqhIX";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hyfGN9u5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970AF10E4D6
 for <freedreno@lists.freedesktop.org>; Mon,  2 Mar 2026 12:45:44 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62294eW63753104
 for <freedreno@lists.freedesktop.org>; Mon, 2 Mar 2026 12:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sxr2BeEaFdYlVQi5HtJAMZPys8+ikBmZeMmfYQkWA1E=; b=npojqhIXjW6mWJvu
 CqyzrLQqfqS88fB99Z/tY2OnTHN6P7TdWWVMvCBDtfOpBQAN7GdkhRtkevdjjBXQ
 hgJYxA8jkGbTgZ+XX1+0MMfAV3i7RlTWe5mfCfWKZSvNLegZq+O2PJ/Tf2jOzV3w
 Q7JhoS7KpG+LAW+gBpw7zdFj+7hd8gwAboVpc9+NXAAlip16T1VrA1DP3Kwe+f4A
 6NgWB1rbmj2ofzccIVkGGEjFgmxDMg7CXd/WDQNZBZD0ln547Rh+PoNxuhCwpRSh
 /+7mprppIbYoUNGGbcAe/Sx0C2YT7+TQJ9a4EemLCQCVby6ZzHWsxB+PsLeJEfo5
 jdC6Yg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7kq8r2n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 02 Mar 2026 12:45:44 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-899c35447f9so38446706d6.2
 for <freedreno@lists.freedesktop.org>; Mon, 02 Mar 2026 04:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772455543; x=1773060343;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sxr2BeEaFdYlVQi5HtJAMZPys8+ikBmZeMmfYQkWA1E=;
 b=hyfGN9u5Rg81L5MWxYcbxVcj5jeb5HPcxeZv5VMers08p98Kf66KaIhB+7Cfc5CwaH
 JqnwrR9Yhkx8z8WUoPso6/ZA7OFetsglhJ5eRWZN3O39UY30HAgTgsGHaunh3IkTyNSS
 4RgtTorf22wJj0w+0lP5uw3yPA3BB2bydFIfRON61zHMDLdDF4nl9ehqNmjZo2M5/3dq
 PCEywDywGIXcjMaQ2xHAMNaHTUCJTl7MlSQDGjQObeAsuSRECZObK/5IBiixaEEAux8v
 G8MtCieH+1jRhy8wacLCfXo+pLu/KCMZwiuzNBUjRXM2xKHCewWuh6+vCZ7lvAsNtR1t
 jLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772455543; x=1773060343;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sxr2BeEaFdYlVQi5HtJAMZPys8+ikBmZeMmfYQkWA1E=;
 b=b5AwC1Dv4ehp1cVd7W9uNtSwoIQRWpTLtT66xWgP1KngPxPI8piP0YwZmO+alqWu1F
 cJpoTRYoAoUHPQjtjmIBKlfchO9wMhg2JGw+j5h4W9/AKbUgQCsvJQe9vkemsl+IRAZH
 IUauxjuqHq6Kzo4uS8cbMwtv0SGxf0lBJvQ3xb8mmU3fQWsN1auGrS32QzsK5sOWQFC1
 5wu6OBsVwuqZQ3/XQaui/VkP2viiHWj4f+JCfMa4mXCtWJkrrMDxgD8wPymcTI7yOFCV
 DsII6+vlVC+rDOn3LR3br81zrSd6IILfiF8ZcNR59NLmC3NG+P4nZ40L1GQW4891zZQM
 9GWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTSZiNNO9DU/10umvYlFxTJN0nFAUHNWlRxQzXNC0lOmY0z80QaCaNj5qr9pKJjWS1hS6v6IDfj08=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywcxgpv8yXLyWlCHKNuJ9NSPsusDpHwSPzJaDTS+rRC0P9ADHH6
 J6AFQiRx6ul1XmPwBkzS9/Mjf2Dly6IkFb2/4jnMaL4OD1CXD9ggCKrSbjlXQBb/R4Sx3DBNSVZ
 i7a4n2L/6xsvsjHb8DP80NGv4LHLgulOWc7UGkfyBLeSeqTedj9A30GbpCecufHLdM6eX57o=
X-Gm-Gg: ATEYQzzjzJlfjscfriXpR9K0Bxe8c86Kgal7rD52mMjU2DSlc7Lr4VSLweBr/7w9Fpm
 V/bc0Yy/UBFfAIcfDNoW1ZdP/RHKr43djg+mmcWb1u++2svLbeBGPnAzMl0BC9YfU6DlrJ0YNTU
 bE2pKktj1uqzx8HP9VECeG8ksXMqO1QKM++WqW9OV/eChmJ2r7OQ+s4qqT/BTy/sNftBLdzDctp
 j5KLSC3p9id/olU+WQ7Dqac3n/HF0XwUxwht5gtVdRZc0MM5luFipfPA3nJgzJ1fqAeGqhNfobb
 XWayl6rlemer3EAe56nGWwtcwXQgCdxRWxvDKL5ZQeSw2YIUS5wmqh/HEP4f+BVlMYwW8VOgQ+2
 yc9WnbE2tOo3yhqFNAQ7J+10HmeRFjw6nNcRlbbwk7W3jPmL1N15DWkMnX5151MC8XtYhkw/s/D
 9soI8=
X-Received: by 2002:a05:6214:5c82:b0:896:f9ed:bea1 with SMTP id
 6a1803df08f44-899d1ec1c30mr121608096d6.7.1772455542904; 
 Mon, 02 Mar 2026 04:45:42 -0800 (PST)
X-Received: by 2002:a05:6214:5c82:b0:896:f9ed:bea1 with SMTP id
 6a1803df08f44-899d1ec1c30mr121607756d6.7.1772455542465; 
 Mon, 02 Mar 2026 04:45:42 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b935a597d02sm468049066b.0.2026.03.02.04.45.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 04:45:41 -0800 (PST)
Message-ID: <ae03232a-49da-431e-baad-c5ae7b85eccd@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:45:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] drm/msm/dpu: simplify VBIF handling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bW6UCOMpGVaemz8q9oZvP4j-QchOVAvQ
X-Proofpoint-GUID: bW6UCOMpGVaemz8q9oZvP4j-QchOVAvQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwNyBTYWx0ZWRfX5FiOh58vPIBP
 bxqTL9DfL+COjJskK9ieIUCpSTIoGW37GhvWoou4gmnW3ofLp/vb13YHxwV1npk0n5U3NgHdQ+u
 iVQyA5nEpvOtLu512RLow/UpvS7gimt8o/HwA/c9yTDvqTZrs86Ow0Ec00H+ulSmmR9vZQ4RcJh
 /tbVQXq0vYpfuo9CxuWIOc3IUt6z8FjV9u312co2K7/jrI7Djb9UNC2mYUbM6WHjo3Sl/unA5RO
 7q9y+iHQZPNWhRRPJN+LZlxLNBSrRTis7zLccCSsoIhWuOxwjgN2FdYA1UXT9AhRVk41rIowlip
 iV7QcSxJnXhBl5uxj7LSSuYrSXSbGch5dE6Zw4OmGlpr8/ErSZnS7tvKsJgrvCSLB0WHJxY4IYY
 taO2if3k+Ezf+MN308qZIhhx7Bd7d94VBKRwD9rAGb1rLtDWu3609mWLgPcjpgtywsPvjPa84ku
 5UrxkNhX14aeMneWN3A==
X-Authority-Analysis: v=2.4 cv=GLkF0+NK c=1 sm=1 tr=0 ts=69a58678 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=TmkEJ0c5ACjQ8L-i1cIA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020107
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: BAD581D8F78
X-Rspamd-Action: no action

On 2/27/26 7:36 PM, Dmitry Baryshkov wrote:
> Once Konrad asked, what is the use for VBIF_NRT. Answering to his
> question revealed that it's not actually used by the DPU driver.
> 
> There are two VBIF interfaces two memory, VBIF_RT and VBIF_NRT with
> VBIF_NRT being used only for the offscreen rotator, a separate block
> performing writeback operation with the optional 90 degree rotation.
> This block will require a separate isntance of the DPU driver, and it is
> not supported at this point.
> 
> The only exception to that rule is MSM8996, where VBIF_NRT has also been
> used for outputting all writeback data. The DPU driver don't support WB
> on that platform and most likely will not in the close feature.
> 
> The missing features don't match the extra complexity required to
> support two VBIF interfaces, so drop the second one and all the options
> to support it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

This leaves a trailing 'bool is_rt' in struct dpu_vbif_set_qos_params.

I'm not sure whether/if we're going to use that specific set of functions
with rotator support, but we should probably retain (and at some point
recheck) the dpu_vbif_cfg->qos_nrt_tbl data that the catalog houses

Konrad
