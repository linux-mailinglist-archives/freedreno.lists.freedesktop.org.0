Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KD8lAE4+d2mMdQEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Mon, 26 Jan 2026 11:13:34 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5FC86800
	for <lists+freedreno@lfdr.de>; Mon, 26 Jan 2026 11:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B9788A3E;
	Mon, 26 Jan 2026 10:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMOcTvId";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EsuXEfr9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B8AE88A3E
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jan 2026 10:13:31 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60Q8vEpC475546
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jan 2026 10:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 919VH1z/KO4piWrGs8r1dcfvIGrj9JNBtgoqDYAJ5XY=; b=fMOcTvIdQPDgjFDs
 jIZ/0VcEtKXXBFy5xxrmD5Nq40m/Pw/IjAbClC1TmASJKArPtajLCpXMOBLZsHVV
 AtZlppsW6LVHVa2OmThj7ZY3LOAtnG/Q5ilSoB4J5AyCsAGKJTyNL44C2tHilIJu
 8jgkcmoWWy7ixir7WVNLFCXLkJDXF5Jk0J9NBSxUEm+YdsutMGZQZFWWU0ntPEPg
 MudHEfoc1YGNi/vPbV23OJGivXO8K1fDJqRMx87iUlWwnxhrvRcTsg0qQAhjvYxo
 diK75qgPtyAAZM+Dyz+YgL5/R65hXNw5+NIkWskIX4pvDWeXslOqjsySoc2DayIz
 RlKuUw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6uv5r6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jan 2026 10:13:30 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-5ee99a57fe6so4705965137.2
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jan 2026 02:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769422409; x=1770027209;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=919VH1z/KO4piWrGs8r1dcfvIGrj9JNBtgoqDYAJ5XY=;
 b=EsuXEfr9D1hL0nqwJm21G3AbPPnXjOsMAbdFf6Il93vaPofLHKHBHbwme1Ve/Pl5RD
 oBt1Mx2oIKHqpE5NSS0YX07ONjcxGTaO8A2DFAwkTeJ/TQ/M4YDTEEFNaLuwiAJLwWjt
 U01ymtvu2zl6fbjm6uTMCLZA+3kVmNqTXbOpCSBk98tWH606tCKGsufwv67NUrSVf9H2
 JIXr/0+3crZpIMUk6a1iuVYL8oAmPDjvQ/J2Gs+rYYCr3p7hS/cKu3uiYWKN1YRrCgLL
 vPpiXSBvtNZScQFcVV7tC3YF07wD6+my9eg1hP8Lodr1Xr5IVKEooasQ9UaMvFIDF/ht
 W7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769422409; x=1770027209;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=919VH1z/KO4piWrGs8r1dcfvIGrj9JNBtgoqDYAJ5XY=;
 b=mJPkFnGa3q+5XPH9gYjQJ1/2t1BFkmLDhnflAJ8dCGijj4wWuaR3astbJvX3elqV6G
 W9lNR1jJtQrlSImn74CK1zqMT2j3E6eVu1UzSQIkkI9AB0HtHFxWGjKKp/PqW/LlIA1v
 n+FSJ5WfOTPJwnmz5TVf06DAxK/4KXsluPPt0Xi0xs6RdTepAVulNTEe+RdOK27mSs4c
 QFLEemedbJrtnCzw5DbgKiFg4OQzCnBDAX76qdEqZLUtKW6FsaN4ijrqs/WWf2FkQ+0A
 BBvAoZ8kEdKJpKSi04TslPFe/KKAvyinyHHXvc5CxJk1eBRqCVTKzX+sLlQSx4Kd1s1M
 hAwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5HlId9iCoq4304sldDMmYTmgcZzAQRgDudcGKqbK+SDgqnYWF3TYQE4rGX/vVLqsycs0viL4CGug=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxs+A48MQOh9i6z+0iamqU7b7eE6IwHPreapxxe/EPnWNFB2InC
 8ukOn059JcH2RoEXO3QDi15CTL7tyX2oe0xXKZrzdhYKorzdIVRYjSZC2kpQYt+fkxKf1P5sh0a
 bIqH9/JeA4jbB9mVJOSAv+okZsIpWUeG95N5hvQWg0Cmo37rlxy0y1gvkTGIQJWPw2wFUqPI=
X-Gm-Gg: AZuq6aJN2UZYZLkqaCkEYDtkfxZjOQ28tOVFtYxpOKicCgV+RJaAU0xLZ+je+izhk93
 st8ieGzrSisdRtqUJ7K8WIXJoMPNAaIdwkd9DN30iP9wA63ah24hz1kifcIf0jHNopIsJOcMSwu
 n8lnkToqWTXxCnH4Unh5kMnMbuvwBV+2piHWI3eNgFiWSfN4nb5m3yDqQ3aAtmK5oAhxhFgHFty
 SnK5WEpAHZvy88i8jjUeXkUxQgj2E6LbGmNmcP5G3kxIDqLd6L0Vg9YWHi2TXir3oYJiA/5wsIM
 5FTy1km3T183SRbfb1lj97OG96sXGlfsM5CgEBZK8a6BJ9Vtm0qWd+zrUdpbZVffDjFuxZJaQFw
 KBcHfCTZWEY9buDUHGPh2odekNGvn94SPNbSw6S83pu2D7IaShxOnBw6jEpj81OgI
X-Received: by 2002:a05:6102:3ec6:b0:5f5:37f6:2b4e with SMTP id
 ada2fe7eead31-5f57654956amr978551137.40.1769422409609; 
 Mon, 26 Jan 2026 02:13:29 -0800 (PST)
X-Received: by 2002:a05:6102:3ec6:b0:5f5:37f6:2b4e with SMTP id
 ada2fe7eead31-5f57654956amr978543137.40.1769422409217; 
 Mon, 26 Jan 2026 02:13:29 -0800 (PST)
Received: from [10.205.56.101] (84-253-213-87.bb.dnainternet.fi.
 [84.253.213.87]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59de48e5d0asm2542556e87.22.2026.01.26.02.13.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 02:13:28 -0800 (PST)
Message-ID: <91d590de-fa00-4df3-923f-b49ad00cd9da@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 12:13:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 2/4] drm/msm/dpu: Defer SSPP allocation until CRTC
 check
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org>
 <20260121-msm-next-quad-pipe-split-v17-2-6eb6d8675ca2@linaro.org>
 <6kzd2g4hgffqz5ipaqbourgiefuxxh3njj44n35blo37z6hhhj@us7lzlgmjuld>
 <CABymUCMf8LxX6VWUuzNJP+G1y3Xi5-CVYhaqLR7F=kU6ZgdcgA@mail.gmail.com>
 <c56e4ylgwcqni23btaxegdbfg3tbkyp2vtjtboeb3kbvcfk27u@vrlh276djtfr>
 <CABymUCP6ZDGtEJeQSZ48x8TZyJ4gKVDC+JzJRz-tZ0ksCUCqsA@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CABymUCP6ZDGtEJeQSZ48x8TZyJ4gKVDC+JzJRz-tZ0ksCUCqsA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA4NyBTYWx0ZWRfX+IzBy/4/Jx+R
 O6Bqp6dEvBpEvHVMI5Nx7TyU//VlmKx3kb3g/7dSUtmCXAAzy4TfO8ehHWhyyOsyVpWXxYBku3X
 N4/TzdEKw22TGYyGdQFsFX3b17A97LWvoyXTiSX7ybJ3FTmK7+TYTvwejR/HjOvvsq0LY9/7KgE
 0o2Ag9QMWG5Z7c+FZ2pBmZONaWdlflBvgdEk6ID59KbCFGA1GjP7x2YxGHlZRP28cP9S2iMApBa
 UTfZ+Qe2Ii1+i6M9+J31BGory3pUM6M+OZWlQMKCEX1zhEpfDK85BQhrjsUWIRc3Z9kYDx/7cM2
 71ZhQrQ6bP5s/8c0jYaocag3iS75ggFl9PJuSPR9sx50sKG4+z/w75blXpFwrUjKp9OGT+O+KSi
 SxM5frn0ZSYBdp1I+VRguHGZuTYUssyAFn3anF3Wc98mLAoYSDh8AM9scPhsACxX1JvA981Bm1J
 TD0BRIRFF6NmptWxNhA==
X-Authority-Analysis: v=2.4 cv=UqRu9uwB c=1 sm=1 tr=0 ts=69773e4a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=oW9j1mrv7lfAxSiOe78TcA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JU2WE-GTjbXmrkkuVJ4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: fPxgDfcyGnbig_zBuHAzh1SyA3imeF0a
X-Proofpoint-GUID: fPxgDfcyGnbig_zBuHAzh1SyA3imeF0a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260087
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jun.nie@linaro.org,m:abhinav.kumar@linux.dev,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 5E5FC86800
X-Rspamd-Action: no action

On 26/01/2026 12:06, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月22日周四 18:22写道：
>>
>> On Thu, Jan 22, 2026 at 02:03:25PM +0800, Jun Nie wrote:
>>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月21日周三 17:30写道：
>>>>
>>>> On Wed, Jan 21, 2026 at 04:01:51PM +0800, Jun Nie wrote:
>>>>> Currently, plane splitting and SSPP allocation occur during the plane
>>>>> check phase. Defer these operations until dpu_assign_plane_resources()
>>>>> is called from the CRTC side to ensure the topology information from
>>>>> the CRTC check is available.
>>>>
>>>> Why is it important? What is broken otherwise?
>>>
>>> I see. Thanks! Will add below lines in next version.
>>>
>>> By default, the plane check occurs before the CRTC check.
>>> Without topology information from the CRTC, plane splitting
>>> cannot be properly executed. Consequently, the SSPP
>>> engine starts without a valid memory address, which triggers
>>> an IOMMU warning.
>>
>> What is plane splitting? Write commit message for somebody who doesn't
>> exactly know what is going on.
> 
> Thanks for the suggestion! Any more revise is needed?

Sadly enough the text below is not a significant improvement.

> 
> Currently, splitting plane into SSPP rectangles the allocation occur
> during the plane check phase, so that a plane can be supported by
> multiple hardware pipe.

What does this mean? Without virtual planes in place, there are no 
multiple hardware pipes.

> While pipe topology is decided in CRTC check.

?? What does it mean here?

> By default, the plane check occurs before the CRTC check in DRM
> framework. Without topology information from the CRTC, plane splitting
> cannot be properly executed.

What does 'properly' mean here? How is it executed? What happens?

> Consequently, the SSPP engine starts
> without a valid memory address, which triggers IOMMU warning.

IOMMU faults. There are no "warnings".

> 
> Defer above plane operations until dpu_assign_plane_resources()
> is called from the CRTC side to ensure the topology information from
> the CRTC check is available.



-- 
With best wishes
Dmitry
