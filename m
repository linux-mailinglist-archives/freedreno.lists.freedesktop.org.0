Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C2CB186D0
	for <lists+freedreno@lfdr.de>; Fri,  1 Aug 2025 19:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5481A10E16A;
	Fri,  1 Aug 2025 17:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LfM0ZBEY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47B110E16A
 for <freedreno@lists.freedesktop.org>; Fri,  1 Aug 2025 17:41:09 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571Hf9wO000996
 for <freedreno@lists.freedesktop.org>; Fri, 1 Aug 2025 17:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=TAjqsWG+09WgcEob8VLyeHOX
 BEVCAsO//HB0wzN0Dsg=; b=LfM0ZBEY5sfySZKfIylbPz+OU21VVVPRZEKyqQlf
 c23LIfgNs2B3XFaRQybRDSFl3TDy9hceOqdA93nToXnbyL7gu1C+TIoXcnAZleLD
 iNJiQNnywFXMCuUOHGolIA/PYQPzHwp9hnWOJagCQtqCvoHXYf0Y7YGlMJsC200F
 bK7HB1bzVP8W1G6EcoS2S4vOuZirCLFT7pxbra2GauWaE8EScPhbUCV4wqWLGPpU
 kN0/EYcsp0KQT4cIcLwJtKFjKmgwpSMM0rBzw41pkPImjdhrXI2fyZVrCtwF+Ggq
 nMt8GWPs8/J6ZVGHI/LSO7krYgbJSLVVTF2bBnEkVDMYwA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 488wgrs0uy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 01 Aug 2025 17:41:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4af08a72a23so12203921cf.3
 for <freedreno@lists.freedesktop.org>; Fri, 01 Aug 2025 10:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754070064; x=1754674864;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TAjqsWG+09WgcEob8VLyeHOXBEVCAsO//HB0wzN0Dsg=;
 b=BXs1WFXUAiyP0c0lOwUkm100YZG/QDSMn/XBnxKTaG2wV+xosA2GiUNdLgHv7akoPi
 7fKbf734nmXtqAMuJP3Hgwx/G+p4W6d8/elcFE2SOSqvWpNullvvmuB/r5ioF9uq1P9s
 pYFGn2T00Jo1+/C5O0pnS4Ybc+RieGFJxAyvp7eHsV9QyyWF9hF9A2Im/Yn+g7mveFlQ
 trMZRcHd/HNIX+iFXf7JLOYyRnIpFisnG/fLYtlaDWGoVvmumKzpqFqCc2f4IENAoqmu
 jpCCjWlBAqtUQS4wBGzu0/EAD/9aosv283ZNSFbtDbkgNQnGR0L+koP0cusQxQ56xmu4
 QGUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULaITk/ZzT1uYDtDN/RAKSF5oz/0isk0qXOdftDkU63bAzGxDiuBPg7qS7JQx+oDMk+1QiZ1dMk+4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJieO2yjWTWEQEGBk1W6WNYxWfecn1HlO+4YdAcOFsUcXMsUZn
 wAWnuuYoXvELRjbD9A13d/lu3673SR7J7PZ/NtCQSss2MWgfEadkxV3zshG+XpJQmkH53mFymCP
 4UmF0LfhsGR9R2FlXB3cvJ62oFu6T/blmslz4YSKDuMtcqGR2MZW3E+JgsIB/O4NzlXDHuIQ=
X-Gm-Gg: ASbGncterArcz9w1u7ZXimBYSGZ8CKNwzAfdw/FDJbWF7/9Xf6uy62u4mRu1KLOMitY
 tqIy2VPjLoCHg38poMuHbmHcECCtIHBuPvy8ELaBJ0zws46vpYQBLlJ78tLpCGLEqPmkiPlleMl
 4AkBSgpz6rE3iOloHbwjY3in28By2fYQOddMlAFmJN02uE6rzh7u378FdRy6eKrs+0uEk0qMRUH
 n3dqSBM6UlVK+sB7a+bU3gL0Qh03/7SiFXPWt0K73fcnKZyiBHMYNR6bw/+ik9h8kCjNTXJqHTe
 6/hXV2OXW0Q5EBr00pDmapc0Wg8zKGPDooc93drMPmPN3PetZpzuxg6CiJRC2tBIfQLj9CkejrZ
 5QjW07EZVafwiJ6fVVN2HqNUtWUEjauKdTUv+TcdR1HUbHOiP3OZn
X-Received: by 2002:a05:622a:4cf:b0:4a9:c2e1:89c4 with SMTP id
 d75a77b69052e-4af10d11dbemr9816631cf.47.1754070064561; 
 Fri, 01 Aug 2025 10:41:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7Ab4B6jqYhlQ+NXunglR7CtdqDQ1rwdXyehj8v1lg2vJ1+icL9dUzr7rCyfChKa3r6LzegQ==
X-Received: by 2002:a05:622a:4cf:b0:4a9:c2e1:89c4 with SMTP id
 d75a77b69052e-4af10d11dbemr9816281cf.47.1754070063932; 
 Fri, 01 Aug 2025 10:41:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-332382a6f74sm6639461fa.20.2025.08.01.10.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 10:41:03 -0700 (PDT)
Date: Fri, 1 Aug 2025 20:41:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, lumag@kernel.org, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: Re: [PATCH] drm/msm: update the high bitfield of certain DSI registers
Message-ID: <e6bg2nin5zqoemjxevqhzhshgeit24t6wxb3pnfazrk6hkxajq@773bvnmqs5id>
References: <20250730123938.1038640-1-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730123938.1038640-1-quic_amakhija@quicinc.com>
X-Authority-Analysis: v=2.4 cv=fs7cZE4f c=1 sm=1 tr=0 ts=688cfc35 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=CjfMZ6mt8HIBDwBlgy4A:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: N2MO0ohaKrr0yYvUka7muvAOy1Dh9qeu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEzNiBTYWx0ZWRfXybQrOtEvplU6
 p7oOQLaH9F4aPoC95Hr7imIGFkVPHAKqSTNNFYIOocDuf5L+U7hrM7C23pOKl1mIdy/dyKwsAgQ
 W8O36K8+kd3VEfKprT+nD473HCPQ1Ak/tUpT2LtaMtlbg5roh6WVmpkY/Ga/iPKHA32d72KPoBB
 gdkY1JyIaBb3Ey5s/vrveJXqv8BiY19ttCCqYqBeNp3wliZ25QRDVrwcgrmDypHVJWUd3zekfGj
 CUuavSWW3DS3lh57BpGt2f2VcavDzO3VgXayBBspU0XN+LwXEgmzx0oR+TGAPAKWuN2lzMNxcuw
 NIS45MRrLsh4j9CKikspvQN3RFfv7rPsU1463W6wKJOI0hTJMR7afNDhOAhamTx+VzX5YI7YApp
 R0WTwcKg/1MD8yTZ6fC3kM3SHwfe2WkV1k1R9d6B75ntPnPkkpiF/1GqSa3V7GYGKIl5yyrC
X-Proofpoint-ORIG-GUID: N2MO0ohaKrr0yYvUka7muvAOy1Dh9qeu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_06,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 mlxlogscore=712 impostorscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010136
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

On Wed, Jul 30, 2025 at 06:09:38PM +0530, Ayushi Makhija wrote:
> Currently, the high bitfield of certain DSI registers
> do not align with the configuration of the SWI registers
> description. This can lead to wrong programming these DSI
> registers, for example for 4k resloution where H_TOTAL is
> taking 13 bits but software is programming only 12 bits
> because of the incorrect bitmask for H_TOTAL bitfeild,
> this is causing DSI FIFO errors. To resolve this issue,
> increase the high bitfield of the DSI registers from 12 bits
> to 16 bits in dsi.xml to match the SWI register configuration.
> 

Fixes: 4f52f5e63b62 ("drm/msm: import XML display registers database")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  drivers/gpu/drm/msm/registers/display/dsi.xml | 28 +++++++++----------
>  1 file changed, 14 insertions(+), 14 deletions(-)

-- 
With best wishes
Dmitry
