Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC39C6A222
	for <lists+freedreno@lfdr.de>; Tue, 18 Nov 2025 15:55:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C10310E4DA;
	Tue, 18 Nov 2025 14:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gRCAtrqO";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PGMIkebz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E864910E4DB
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 14:55:17 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AICB7i82803692
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 14:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9R4KR8Z3hVb3srR6L/xvgE81rkJYUH5zBjgpe0vgwZ4=; b=gRCAtrqOkGyFJVFG
 qpIRzeLY8JUHH5NdixCCo/n1EI6JSzE3uCZH4mkHTjyYJjH1nE31I6Et0OwfiQRy
 5e9geAJKajuiNr7WBX7trXIXYyPdOMfoWF9G+dv5cG/qty2nQ2s0IKoftzAi4B7+
 VWmQ80GLnlY9zLi89hahg4ZWYX0+vxRzHLKxItlvw05MR5Cgx5McznHcrfZqOcW/
 gelw7q1NiaOeaONY76DbjuSxOp1bcn43oRUpE/ITjww3Chnk7bkCnEtNmuDFgF3s
 5dT9sSD3TNAXqS78qh8EtiB4c8gjfoJ02GVtdQxFfpn8BaahVBEhsUmwxXHoSYnm
 wjCLLw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agrk20duk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 14:55:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b1be0fdfe1so245154485a.2
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 06:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763477716; x=1764082516;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9R4KR8Z3hVb3srR6L/xvgE81rkJYUH5zBjgpe0vgwZ4=;
 b=PGMIkebzM4pP7okpU22ySB+rISMUQTLmX19n5iSBZra6Bnf/5pEmRiKyw0fg4ipXpp
 6IujHa4cOosOihnl9t+hh9UIHBxBJYOKHOpkwudtsLi6/sEp0nY7yjXIMwXk1mratSQ0
 3sYGGczuJEggPyRrn0ijiJ0ZS5ijJ4w7QRZhWoXSBnL7NZrKCBgDtTXCxvlO7KCImqdy
 xIbwViq3kgmzdsoPtWdh+fHBnQ22VnatWvx2URjMu1WpzfH35Lsz1CavwqBqULYcIYYw
 llHdoeOksSjWPSbqHenIzHV6mQzp3w9qafFfQvhkTNtBE1d7EdL0rSjguYly3hAmPueb
 pQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763477716; x=1764082516;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9R4KR8Z3hVb3srR6L/xvgE81rkJYUH5zBjgpe0vgwZ4=;
 b=uMft8FOKTBJ052bnHbqlAGy2Ml5Wpn0kLcIKDbdZmC2VTPEz5bfIEGVsbojVkgZga8
 AETpGQDXLWLhW6ABorXI2kLkYtKGUqzilxDBfzmq6RuzR5pJZwFLdWSWFzrs18kaErjA
 UdPIzbO36ZXSJVwcOd1OfiCX9GX1NtWTouaSBSuGo2TAHme7lMN6qxl8blP5nBATvry/
 4iAgQndcPrwcyOMq3gTbN/uDlgiLRpugB6/MgAPB71Qluov3C98RRwOJ3PT/hJXuxWOV
 CoA6R65xMG++vIgXQnhSlglbNRJUFr+1TaQDVJXPeVAlbAfVHsv5/+q+JNBuuCUFTEzJ
 n9xQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzYFMZ2mXfcWDxbW9hVL7qin7TvbxOnp9+eqYbEQIcA2dEcP++VZoiP09v7bACjyXM2JN2lv/amew=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxotHCP/wXG7PVQXO/GizXOxv7d41sryILj+aidsBE1tSqhNA9g
 Q9BpvcVoTe78/Qwo4wRNtwOHAPkMI4qPc1n8nU+O7wwkMQhUv2U9E5vFNuW38Mg0BVqxrtBgldE
 zKXAWWm/la1X9QkwPOssnSzKlNOK/iQyYkD8yHXr1rtARR7FAmCYI9lgIcl2JZM4GkWPObtr6rq
 dheGA=
X-Gm-Gg: ASbGncvs+XXbbl4zL89jzOENSjQRF1BIoiNe0xcCP8+02RlDvofsI8RJ16bxs5V/vcv
 52Ir9SDKAVt1Yz0oBs4sv3yjY7WKgbQSJhqOFtWiGKuNIO9+kM56vuiFlwPFkZJ661ei+pSwm0a
 HyYjMfYWBVQpVho3pb9QIlq3ZD8xAU3YDnEZP9kYNqhPRJCqC3y2QckLk5Sz1E6RRikES/A8dMh
 kWHn2niSUCjeKM2+Obnofkf+o/BS3pD2KOsI62RoxtH347xkBtNk9lQ5gOpaMiiSobEGxLMjFLC
 vGvvvaNPI2sOzqC2kIQ8e39mkFcfsCWNx3gOB3pRI3C54nxV3XIK0ku644BazCBCKLxJNDYsXg1
 Rcux8FddHj8zbQ10NIWDdgUcsBeJn9xNUItO17JcBpAiFJF3P1Sz4wt2sWxtBs12MYbA=
X-Received: by 2002:ac8:5f11:0:b0:4ed:616f:3cee with SMTP id
 d75a77b69052e-4ee3140ea44mr28434861cf.4.1763477716297; 
 Tue, 18 Nov 2025 06:55:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJVZA6dX0gt3L92EL+HUhYgz0yXNr/pNVcybeYXxplcGFGlRqKl+WXB2GoO8y/NFEAU/p1iA==
X-Received: by 2002:ac8:5f11:0:b0:4ed:616f:3cee with SMTP id
 d75a77b69052e-4ee3140ea44mr28434481cf.4.1763477715833; 
 Tue, 18 Nov 2025 06:55:15 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fed90c0sm1385620166b.65.2025.11.18.06.55.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 06:55:15 -0800 (PST)
Message-ID: <5b0b771b-c2eb-4379-b55e-25df10449688@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 15:55:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 1/2] drm/msm/dpu: simplify bg_alpha selection
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251118-dpu-rework-alpha-v1-0-293d39402b59@oss.qualcomm.com>
 <20251118-dpu-rework-alpha-v1-1-293d39402b59@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-dpu-rework-alpha-v1-1-293d39402b59@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a6Q9NESF c=1 sm=1 tr=0 ts=691c88d5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=J_72SDv3VFfFxBOWP40A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: jJWITtLzRk7bFGtsyHIoNO3olkNCcnIg
X-Proofpoint-ORIG-GUID: jJWITtLzRk7bFGtsyHIoNO3olkNCcnIg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDExOSBTYWx0ZWRfX8H5z1YaW+cxM
 BmWqDu6iptKxv4FTw78HFU8h400r9yHOYbFrSPipAq7Cx7jvLEGyFuCaBQSLZyj++HJsWkTwh5Z
 UxPAg0rHgXACXwlwBqZHRxZ6OhHnMDZdZ+z3vtRuQUBS/rNAboQgsDRZ+mTo7oAqtDsmvRGFcst
 oY2jokP3I7d0KbE6ipJkr4fg6lrxzp78k5OhzG4bWUfF/AeZEgwiW84BhnYILO2vgMquz9rf4RP
 lPiE417H+/pUDCLngP+12Ue2q6Kare7HzlobKjBMo4KED3TSWV6y+mnDnrbGYdllQhIvte3puJ1
 FzeT7itQ6+zp0VVwNeO/UwyqAZjBlVVSCgycYpoeTkQeISQtOniDNWX0mS8mMupT1DJ+v9A5b5D
 ykrRkpMg2xgkY3EJTEtjExNuyJf/zQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180119
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

On 11/18/25 3:51 PM, Dmitry Baryshkov wrote:
> In order to be more obvious in fg_alpha / bg_alpha handling during the
> blending programming drop the default setting for background alpha value
> and set it explicitly in all cases.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
