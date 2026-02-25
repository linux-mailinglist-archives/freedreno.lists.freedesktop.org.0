Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UF84MerdnmkTXgQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Wed, 25 Feb 2026 12:32:58 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BB919688E
	for <lists+freedreno@lfdr.de>; Wed, 25 Feb 2026 12:32:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9D010E73C;
	Wed, 25 Feb 2026 11:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="orQZRn+M";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kifr3as8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C23E10E73C
 for <freedreno@lists.freedesktop.org>; Wed, 25 Feb 2026 11:32:55 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61P9TAks2365316
 for <freedreno@lists.freedesktop.org>; Wed, 25 Feb 2026 11:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3UwhFgmW+9RAf0H62dLr8IYTJ0+P3nnry065u5Hn37Q=; b=orQZRn+M47pKGt7H
 9x7/xb77psfK+0qyoRrFHjWKTrNNc5uARyxnWkOC3tzAGQIrzGVwptTdZexmo/Hr
 regQRM0vFIO6/gi064Su2+7ku+mBwb1EwgcgBw16+7nZkt5Bl/bYjCnSXiUSEXm5
 76nDNku++x176wF06VwV3iYuiPYTGfPBVnJ/YoC+1WFXVMp///eQKeZ3GthB5HzD
 g3T4ueSAT+n56RMzag0RWFINKTjb+wkenpVhvdDWrgp6tv6NJjjmlNrYnCsqdMAS
 ybuxOb4ItBvZN5lM7ogRs0Cibyr5AlFERlWAzo+4w7MXZ4l+8VzRxih4rCs4UZBq
 Iq35og==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cherjbcwd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 25 Feb 2026 11:32:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c70c91c8b0so591932585a.2
 for <freedreno@lists.freedesktop.org>; Wed, 25 Feb 2026 03:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772019174; x=1772623974;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3UwhFgmW+9RAf0H62dLr8IYTJ0+P3nnry065u5Hn37Q=;
 b=kifr3as8BmV3KvTTcg3sfCy6nTmLosEB6YeQ6yBQIXP+KYvuIY8tQicRZoMIwiomul
 0KDpL/FSaWJR71KN0Fphk5TIJ2gKIiDC0PNeXhJ3/pcisIQ60A6vcrBKBSz9XpLlK44p
 Q6MH0ytTi5JolleNHybU/Zsk47xB2NDgoz9qcy2HWfC3nVPrqzn5vcgltbe07WSVJ5JY
 x1XWeYr9LpVuUsmT33qoSq/NKLde1jkzHqIX0Odq8ceV4NO+LXG2KMrMMjr7HPOngRzs
 EA3xHINGVwBEEHKA3vw6N2ePtB7qIV31BuZ+Zn2Ufe2loz/Lq4I/+ISFLHLmHZTBAmkB
 pb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772019174; x=1772623974;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3UwhFgmW+9RAf0H62dLr8IYTJ0+P3nnry065u5Hn37Q=;
 b=lekBhIdbF1D8iFOjhZeUlGqYW2JxMmVER9zRP1B4MIM+pjj3XB7qdg73jAVLDA8la1
 jHkYnBTeqwCqraN4hiolAYjIgyqWXv74zfX18wCKPBB3seiSRAAlFNuIj5BtPPMeSzWn
 /wrQT/lzn1Xhk+sIi4mrTubosWkdLzeM349eb5eAiazw754lrxgLe8PNY6Qk4/yUfvvb
 i87cJyUVAlnnzGNxtNpleEeLxCa5s5jrSRHhVenUKbo0d2hAQRxPpfel8Jhaw3X7qJfj
 SdEMnHC3YxeS+EkOiZNrcxbXNKVgC2hcuv/8Rw9ryzqg6gZS2wOri9vrdtBouaoItfLA
 wlrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGsIebLnblmrFNXn5JAOUjOxQXgTtgAFHk7hfm3Q7YvXiDNpHX210o019QmY2EXuBGOO3yg6lZqPs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7Yyh0Z6av7Y0rIll31x1guNmYhYM5JIBUyciGz40s4fVSBjBq
 eVW11hY2eXxaS4p5inDBSZ+dJe4kW0BwlOUHwWX5ZwEoggXCN6ZJ7jfpSmasNdrIou8TIw+vo95
 LtWaWzN+OgoQR25KkfsYbOVX8O7744ktwRpF9mD7AXfnjiadaVDQgG9ZcEosIGI6YcPKTCGs=
X-Gm-Gg: ATEYQzyjlXRD8qev9OWtbPKtc1aghacyNVkfhYGyC6DmfP74h2i4WhoCUyHTFwd6vYG
 X9BgiBge+/Ae5f89rPLq1jp/CFza9/mOKLMaYM0u2J1BRbI56vowddvUKP8Jb815YI1xXUpYgNL
 N6eDFgANYndknjWvvOyuxoe0CdQ9GJ3UFnyNc2IYv2RK0CJUMdewE6sSDlOCy2Ou9WMvr9fgTxu
 nCba4pj6RaIlPz9R8yQL4hWGOSXdUXZxqmrposvUPm+ORiTkKenx5MeQ5Pw4AeVDK+1CNqW2Wmd
 ruRBP0S2mzb6Dl0Hvo3YJaWrPJQBAFUfz3Zmq4YTX2Ab0wVBWgjNVingIA3iIzvX1893gwQmuHQ
 lyLIuEhVK2vB3jEukYtaxb+nP6lBoxkVun4Fxp6gKGIQr9zbqfgIHymSG0mHQbFFNWudOOaVDSW
 +uZh0=
X-Received: by 2002:a05:620a:4011:b0:8ca:4545:aee4 with SMTP id
 af79cd13be357-8cb8c9f491fmr1434475085a.1.1772019174077; 
 Wed, 25 Feb 2026 03:32:54 -0800 (PST)
X-Received: by 2002:a05:620a:4011:b0:8ca:4545:aee4 with SMTP id
 af79cd13be357-8cb8c9f491fmr1434471185a.1.1772019173484; 
 Wed, 25 Feb 2026 03:32:53 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9084c60b91sm513928066b.14.2026.02.25.03.32.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 03:32:52 -0800 (PST)
Message-ID: <aab51596-465e-4af2-9a12-48b64160f77b@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 12:32:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: Fix the bogus protect error on X2-85
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260225-glymur-protect-fix-v1-1-0deddedf9277@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260225-glymur-protect-fix-v1-1-0deddedf9277@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDExMiBTYWx0ZWRfX6CQx0Erf++25
 XuTM8EN8h1FimfisxVGb2R18RknpxvEj5zE4q8+ZQbLdngh0KfLetE4MdKDoA18BMRl77X6+Lit
 I5CTujXLHm3QElwOMMU871kJmEeyZYTGpqPMibklf+6mqKvinxKg3W8gGK+dk8NHUTvj3IuZyKn
 LZqzZH+Lpo90ZipqrPfilGw6t6cdhV8O0fyFqLIR//B0jr+eXljlFm1gxrYe67y6rMHCx0YI9pJ
 YFnWx3ThbfDs9I9lU8cnLnUfsKVM7MS0DTKwbahNhGPmq2YRJx160k8IJHONs02ewsya0N4H1Bx
 meN69XzJWvUBUNNYpjhts49jB3Pw7iH7GvVnlBbbvEU/TOE2QC4YX9JnPfRKI5DKpdvfQ+yjUhQ
 UrcPQgrXzZdqeG6yLYckHJuLGKZ6rtmxpvJWgW0WlBm2jzMnS64bg1SEH38D19VtOnsHW/xMabO
 34/d44XnrKSWrifqn8Q==
X-Proofpoint-GUID: HBgZHDbCO5F2E_l-tfKC29tXEVfgwbXu
X-Proofpoint-ORIG-GUID: HBgZHDbCO5F2E_l-tfKC29tXEVfgwbXu
X-Authority-Analysis: v=2.4 cv=NeDrFmD4 c=1 sm=1 tr=0 ts=699edde7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=mSm37ElbHMQ3LlSfNvEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250112
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
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 32BB919688E
X-Rspamd-Action: no action

On 2/25/26 8:41 AM, Akhil P Oommen wrote:
> Update the X2-85 gpu's register protect count configuration with the
> correct count_max value to avoid blocking the entire MMIO region from the
> UMD.
> 
> Protect configurations are a bit complicated on A8xx. There are 2 set of
> protect registers with different counts: Global and Pipe-specific. The
> last-span-unbound feature is available only on the Pipe-specific protect
> registers. Due to this, we cannot use the BUILD_BUG sanity check for A8x
> protect configurations, so remove the A840 entry from there.
> 
> Fixes: 01ff3bf27215 ("drm/msm/a8xx: Add support for Adreno X2-85 GPU")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
