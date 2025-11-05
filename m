Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D71C36E4C
	for <lists+freedreno@lfdr.de>; Wed, 05 Nov 2025 18:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A67EB10E781;
	Wed,  5 Nov 2025 17:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pv4jYy4I";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G8PVcF0r";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AABF10E2F3
 for <freedreno@lists.freedesktop.org>; Wed,  5 Nov 2025 17:03:00 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A5DB1uC4056209
 for <freedreno@lists.freedesktop.org>; Wed, 5 Nov 2025 17:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=qyYx+66r12SMj/Ysz7zSUgAk
 oAonFWXlCXbOfXMij+Y=; b=Pv4jYy4I3b11wSUZ2im4uhyPzm/y+/stDpujl6ae
 SiNWLdcpi7Q11oQzcyjYzdYjIyNIV9TfBlxMNfiQJ1m+PJN5mUZoWSts3JG93ksJ
 UBkjQ64EkRdw/TMWyHM8bKnHGJJoYMkvYhUUNBWWf2IlinCVSQ6AgGl9KTH/WLF7
 F96b115k6lQXgRqyxp0hHDslt+Jl/+fl++2atmkU2kQFupy8OXAjI0Z1EvWZQprn
 Ktq5855P0EPs5kZjpDbjJP6/SRlwqS5jEsZDAK9b3EtlPjmjjn2M5EPrG6ALcTzN
 sOINubAo76eS/2Ob0dRw+m7S7oEbjs/Ltq6M46oKW84i0w==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7yp620gf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 05 Nov 2025 17:02:59 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-7869476bc20so42418347b3.3
 for <freedreno@lists.freedesktop.org>; Wed, 05 Nov 2025 09:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762362179; x=1762966979;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qyYx+66r12SMj/Ysz7zSUgAkoAonFWXlCXbOfXMij+Y=;
 b=G8PVcF0rM7VtGl3RlEMJ/xB0MBPAGBGgyt+Pkj4s78zphIbMK4pk22/9TN3OZo+p11
 bxiCoys38+nkdCq/PLdSeVEQuROiYG5HDmeGbitnNFSqIZhhP2xsx+Fp1+QVMsxEWmrD
 5ZMxkV4gvMjVZM4rATXjCg2ahwfwD0uJ6fdILBQaIl5iKxN1vdf06Ki8zPKKogOLIqkS
 t7elamOn5S7aNBHjD2if8/5wMqhzyg23ovwGXQSxokQPmOPcWJvn9RqPMLolgu+/Zd4Z
 18MA9Dw4TVJ3IKxBJeFcOT/iVP+0lkzTOjOtgDgd1sBdEdmMVwg2oo2e/SIbvAweVyHG
 QqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762362179; x=1762966979;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qyYx+66r12SMj/Ysz7zSUgAkoAonFWXlCXbOfXMij+Y=;
 b=Wjh8NHvSI8wWkszJBzJmwn7Ba3NsrogN8eaa+VuNpFChhUuWNhqNek+mIedRpmX1qp
 8yg0gtrh4Vq3UsqWwi//1SSmi80LIueoeyCfJapx1voV3NcGDLnw6UVZNbFuKYFrWC8b
 JPq7H7OwMNmJG++wR8PxJEL1QkhK2xSJS3osITTso/2YVY5j++kvRxHTNMz3byUV2cmo
 Wi2sILwVKqKsq+3WFWGH424IeQQyNxIemeDy22kilOfQX7mdFOoTPWP8gtw55NYMlIsL
 CyoXZNI26X8OfrNUYBBOGtQlraET2PpI8XgZUVxXLcy/npzn92Hc3p6WeDXiyhTNv1LP
 hfNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw6wjNYitkcK0+Bo4EZ9vXW/yS9PD7fvGtAdUJyNjyZZf8EvB4NZNVpUx8HIdjPRbDm+mkKQ147fQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPziakrrxXklQJxlofll4xhFUwmAift5BBgENnxhtGvTjwgXhf
 7BguussDv0EZAi/VQapya2MTXpGNDRoD5WLXXy3WQRt9+CbbzbPtT2uNBMM25Z5YDAGVKIvRKr6
 eoHmzP2NZ5jRvaMVc4qSWiytraIe+Pxb+hS90RUDW3X5w2ZvwW/AkGiXK2RiMdmqivmTftVo=
X-Gm-Gg: ASbGncu6+5HLPaUm6uLr45ZQPTmiwtnyZv94dpFhB4CFUk/nlwYx9HwNb3Sz6hYAnd7
 sQT9t2oAqqZNp5OLiVRez1vYeBpqNoYmEs5PD0JWxJzWP5Pw50rNgYna1ungykDyuK3ZnN0NUdn
 IbdQaU8g5p3NW2uZx/DZ+3dUUdW5hwTXIxBDIxxT3Edc81PNmmTKW9clwWiuBDCzx+ImC6ORGXb
 YVle39NErln8wYshH29mNBkWDZFBLamn8Pmv7mnSUvKT/nhnSET1L6TR5MyDBg8JOrURaIPAa7t
 OQT8pKVZMRXFGoSLFvKaRUVLfwd7ReReeLmo1Vo5tCvWJjASETPwd7RJJudc/YzrD7G+zyrXyIC
 JGr6q0FswP5ZVO1GHVFTUpNDeubLL4n7+vh1GsGb1hSxI/YDFKY5DZFSV9o5N+nDEU3FQaTUKEj
 ObfOPAYf03DMCd
X-Received: by 2002:a05:690e:c43:b0:63e:3099:fe7c with SMTP id
 956f58d0204a3-63fd34c50f5mr3160659d50.16.1762362178874; 
 Wed, 05 Nov 2025 09:02:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTAmyohmCTXGVTToGXMGdUogTSBLrIX4kz1aq4q66xM2USJqaQ352zw9xnhAw2RV1nJjCJjw==
X-Received: by 2002:a05:690e:c43:b0:63e:3099:fe7c with SMTP id
 956f58d0204a3-63fd34c50f5mr3160583d50.16.1762362178181; 
 Wed, 05 Nov 2025 09:02:58 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-594492b411esm34691e87.105.2025.11.05.09.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 09:02:57 -0800 (PST)
Date: Wed, 5 Nov 2025 19:02:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 2/5] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
Message-ID: <motuct5ezykbkta2wz7ek2vwnfaamphrl7b2wpv2bvu7qnnbmc@4j4aurlva4iw>
References: <20251105-a663-gpu-support-v7-0-1bcf7f151125@oss.qualcomm.com>
 <20251105-a663-gpu-support-v7-2-1bcf7f151125@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105-a663-gpu-support-v7-2-1bcf7f151125@oss.qualcomm.com>
X-Proofpoint-GUID: NRjmES1xE9v7yXud9pi3yTyUt0uXko2e
X-Proofpoint-ORIG-GUID: NRjmES1xE9v7yXud9pi3yTyUt0uXko2e
X-Authority-Analysis: v=2.4 cv=TsrrRTXh c=1 sm=1 tr=0 ts=690b8343 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=UQAiW8fk4jwks4S4FoYA:9
 a=CjuIK1q_8ugA:10 a=WgItmB6HBUc_1uVUp3mg:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEzMiBTYWx0ZWRfX1HjlgcFmlUfm
 JM7ET1zVwUp75LmTzw2NZ1yFRfQhdObQ1XV49+mCABW8gFjtHxRJsFxflMPBiKrQ77qypnOrVkM
 f0r0Ol4GzKlImEMBw3euMtBDFVoMMCYkXs/cbl5qz/uh5Ajj5N0++ZK4KDAZBaY6r5o9q7ELXCD
 Kme9itrZ96punpWMfLs0jy5MODCx8+hWppzZifkhjfpslYgQX3uYVHLOd+MaMrwgcqsMMthzrAI
 ilPKgYEID6lmdbzWfof5siTPzIGOcULfVzvKTFePiYM7AguWi8JloMktkfKfNd1xhb16NTHQ7aQ
 5qEi7i+yL2xh0zZaltRnUNkj8mg9D4gJKWG8MTmWG18W3YcNfEC1YQ3urNLPDahMzKSKmUS1aZu
 XV76v6gvYcthr46FB5EIKcQsqPy+rw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050132
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

On Wed, Nov 05, 2025 at 10:15:46PM +0530, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> 
> Add gpu and gmu nodes for sa8775p chipset. Also, add the speedbin
> qfprom node and wire it up with GPU node.

Technically the subject should be updated to use 'lemans:' instead of
'sa8775p:'

> 
> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 119 +++++++++++++++++++++++++++++++++++
>  1 file changed, 119 insertions(+)
> 

-- 
With best wishes
Dmitry
