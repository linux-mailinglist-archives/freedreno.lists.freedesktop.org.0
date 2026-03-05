Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAA7NPRaqWkL6AAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 11:29:08 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4033120FB2D
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 11:29:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C191A10E25A;
	Thu,  5 Mar 2026 10:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XWZrYr25";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WvNQcyVJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340F710E25A
 for <freedreno@lists.freedesktop.org>; Thu,  5 Mar 2026 10:29:05 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 625AFja2936026
 for <freedreno@lists.freedesktop.org>; Thu, 5 Mar 2026 10:29:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Je2kLfBA0eaKgF3s1aSk3YHEedUIxzkfsmlbL2qkIOI=; b=XWZrYr25yb7DS2Uu
 r+cy9yUJSvwGM9xThCF395BP837XsFYValw+drEE/Md1E9OnwiUTOxMWcRHYG+Z6
 5BLrGu+2tycpxuyYmQGQlS7oMK9kZGcRvTnUTxHKLyOwgjvyJe+NoGvWOTtcztB6
 yDPFjmTNUPXwIAJbwM1ezaCmhsva5NHFbL0vSspYE0N7tteYMJWOybTDSdBJp5S1
 5srmD+RWy4b4N3Vy6D+QbwE5RUITbnLpwug0xrLZOA+CBZ+BJjxhpQ0W8NjXzAwl
 PAfr0H0VlXyoAhzuINmbl8uXeaHyqW5Tv+uY8FfOFou7+Ih5DhuKC79H8eVApIWy
 +vEmXw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq04u1nd7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Mar 2026 10:29:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb39de5c54so573215385a.0
 for <freedreno@lists.freedesktop.org>; Thu, 05 Mar 2026 02:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772706544; x=1773311344;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Je2kLfBA0eaKgF3s1aSk3YHEedUIxzkfsmlbL2qkIOI=;
 b=WvNQcyVJ6w43U4mhfonipw5CeCzsyAupE5yQ8lr3sGdQDcGCHjhJB5wGn2Duren1js
 xkSXNpmPQ6TGLHOmKx6qTSb1S/qzFpd2xBMm2on6DnEe6/7SNQYe4MSIj/LzXXEYBKZN
 HMaOoriByXN3wp+xnuMvY8NmVBk3eQbh/sq/oUcjgMIG5whbumHinj8iUN3ThZO0qWay
 OIfbCu7dxFsuGCZ0rZADomTl+KX6EwxUL3M6N82vabae2PhqdwCorRflCXBpL8XO1fvS
 ZmbULPz6+PSjZBzvtHJN09GlYZvj9kz099Ip8dNDmp+nfUptdxpQVbKRlnt24TqSwIkZ
 zTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772706544; x=1773311344;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Je2kLfBA0eaKgF3s1aSk3YHEedUIxzkfsmlbL2qkIOI=;
 b=Tc55JrYHZ9hdryztWVKFvL9Q4iRXdpRuMFod4FAuyM3s9pHst5MxTNDy2/6JmTyjoU
 GFGM31Tt+rD0ypVLnM9yypxcFcbET3kf9URgMQhuu2cJKvPmEAyT2tccQDKx81hm7TMD
 N3pkCOP1EO53x85LR9NWuz8yL2LChWLMBOiNgbUwjXBttFUdtKhCllEAzyGXPT1J6Nrc
 geX9mOtQItlc91uDksx9uZT8Bx8+mAu5kd8d1iClxK+JnFNgC8uu5En1PuIEDmGkuPBm
 dtfOI1D0vUlK2AMnDnL6DAJ0Qyd0dgBNump9bqfxAd0QoflZm0fgs7yKDINo9OFzTiw2
 k49g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPD2Q1LKiSGWjeCHFWWudzhtOrp/mgqbkeDviLNqqvOtEbKE4x3URtIMTR29DJSSQq+R7vwvAQ36Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzP0m7yO5H2aguHGU/JJbvKvpGn4dWqDZORmLxXrO4Fcs6u2m+X
 wtY5aJ+t+JM9IYmNn4NMWxsm8urwHYuZ223wHhloj7YeHlB4idXrzmzcodyolHwT6htvEp6pn2x
 Yl58yMyoLJAcJj19slWJfy5hR3z8Tc96E4XJuGmXEifBYDSDstDgwVPNH+nlFL0TcOsjttDk=
X-Gm-Gg: ATEYQzzHr7x0eFwI7cuJUy3144oIsDlKNVEMzOFYYF7GClrCP1n6OGnHq3p0Rlz7XWw
 h+bWH/yMtBWTIPGtChPoywgJgX+pLj7ulyh/W798iNpKUUz4OtROmjnthpDJ+ydrD4MrrUa4QIO
 Fw21cukYQsVNz6Psdqit9T4bg7EmiWvOBvzNb1jNUPrLtDHuYHSOPZ7T0k4WLTI4n2IqWC3HLjH
 OJAsZs/Ntx2sbaatOmlISQ/d0ybkLOWsx4KCq9rl5dfcSB5vr4/SGmHCT1wa5uyWg5tvWa0VGpn
 iA0LO+0zQ2MJNc2m4hhba9nNBosJSeJtqWmaZxi/k3ICVt4RSs+SkhSi9AaMcZatIYKohkfUwJE
 kRgVGKd9qS1Kiwp7oja72x1A0mCq12RrCkQZgLFh1S/lJF1MAuPM8yZNP6ihI3Y/jzQX2LqpMka
 Q6rTE=
X-Received: by 2002:a05:620a:1904:b0:8cb:3fa7:c4f0 with SMTP id
 af79cd13be357-8cd5af866e5mr505827485a.5.1772706543797; 
 Thu, 05 Mar 2026 02:29:03 -0800 (PST)
X-Received: by 2002:a05:620a:1904:b0:8cb:3fa7:c4f0 with SMTP id
 af79cd13be357-8cd5af866e5mr505824585a.5.1772706543313; 
 Thu, 05 Mar 2026 02:29:03 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-660a55b191esm2641468a12.23.2026.03.05.02.28.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 02:29:01 -0800 (PST)
Message-ID: <58814d16-6638-4f8e-82bc-67452f6faba3@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 11:28:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/msm/dpu: Correct the SA8775P
 intr_underrun/intr_underrun index
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mahadevan <quic_mahap@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, stable@vger.kernel.org
References: <20260305-mdss_catalog-v5-0-06678ac39ac7@oss.qualcomm.com>
 <20260305-mdss_catalog-v5-2-06678ac39ac7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305-mdss_catalog-v5-2-06678ac39ac7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jSISvI_NYD_Q1mJMDsjCR02ny9kIRL2n
X-Authority-Analysis: v=2.4 cv=eqTSD4pX c=1 sm=1 tr=0 ts=69a95af0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s80QRqCtEMuw_QvzVh8A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: jSISvI_NYD_Q1mJMDsjCR02ny9kIRL2n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4NCBTYWx0ZWRfX4A02ryOui3Ch
 E/OWFy2PvoEr8U0wQ/+Vhyuk2aDv1nxUKU1zZh0RtUE7+qDoypwyszQZbVBKMSTeJOHpJivqFab
 vGrGcaYbZXrcYAG4FaJedgv0oY+lDMWs+n2x98AQf8WqYIWvFPdubDT1+wpU9EJ0X4eC5T5ZbXV
 M+QZLhaohg28vm5J/flPP6pI7LoR+3wLum83ksF3AlOoaUzxEGenXg+fUYR+WXMTsJlQeKMt1QV
 UYtvssK1Zvgap7ofzxPMm7Of9yICnnTau6pDy5qHiQRkcZvx6YCnLBnoAThuLjiSFYT2er9RRyK
 b5h/OIjOC9wm3mnsR9rj1+IDIpkB/J7YJWWjfiROmtvT5xfemnFTQMmhFlnn+OOZRtj8p7kuNGl
 VVtjqSeaWdl+WpIZGsCwy3EGMtLWDT4XxDxT3GVKKpOYMnGLFQFOfBZhKa2z4h21c/Rzy76UCMW
 zJMs6nrli8SXczUzodA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050084
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
X-Rspamd-Queue-Id: 4033120FB2D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_mahap@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On 3/5/26 11:17 AM, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> The intr_underrun and intr_vsync indices have been swapped, just simply
> corrects them.
> 
> Cc: stable@vger.kernel.org
> Fixes: b139c80d181c ("drm/msm/dpu: Add SA8775P support")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
