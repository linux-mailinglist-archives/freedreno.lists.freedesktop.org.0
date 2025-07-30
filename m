Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9992B16106
	for <lists+freedreno@lfdr.de>; Wed, 30 Jul 2025 15:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821D710E69F;
	Wed, 30 Jul 2025 13:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FCRsIt/u";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E3F10E6A8
 for <freedreno@lists.freedesktop.org>; Wed, 30 Jul 2025 13:08:12 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCb90Z017604
 for <freedreno@lists.freedesktop.org>; Wed, 30 Jul 2025 13:08:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=rCoCba3PaUuakN2dddfrr36z
 ZpUe2mMvVXboTEOCYoE=; b=FCRsIt/uDiAJa5REs5cKwMn7O0aF9XVlsTRTnpWG
 BpY6aAHc1kYOI9RLjM5cUn1Jk0cUj0rBH+tkINWMZfcSbRcCjuWRG/O1cUTK+86a
 1gMqfJo9mJWrfwS2UoBjsvAX6XvLGTW9wHXClWeb5d6Pmu3mMuWuIuB3436cAEeh
 QpGb2A2kH0Mu24U3jVuNJm7YwlN4ijxfWHJrnLTfOR2iFMoCYAtvyWHFnEQamMcb
 7WjXnK3fzagFO7XMgCK1397GX31vpWJYDv4TRpBf/8SyQAQX3oRYbyzVIN0R/R33
 fUgfCC3pxGczAfZ0r/YDyiaUwgUPNvHVdd7M/b/rXBkWvQ==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qda3rhv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 30 Jul 2025 13:08:11 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id
 006d021491bc7-6195f7f9ad7so1119624eaf.1
 for <freedreno@lists.freedesktop.org>; Wed, 30 Jul 2025 06:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753880891; x=1754485691;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rCoCba3PaUuakN2dddfrr36zZpUe2mMvVXboTEOCYoE=;
 b=aI6YnYjL/bVymH79FMP9aYbifue7sFa12jNV2P1r1GjBrtVH8RqDrh0hL/pEdG3oE8
 d65N4bfIsQOW461tOR+4y8RLJDTwVoCW99xQFBc+ZU33nr70PVwfGRC2d0RtPe71SAuT
 Xclotmka0542tnlRce8NWTcSWpgwCCpcsX09nto7vFV6kaKjsFfI7mVH2dneK4PPyoos
 OHhZAjwlmB/Yn/rdsZNtWFHz3hU3hC8gIstf1iHLQLXeWt7+OJw3cbIdqnHpC6yWDzgx
 V68eLUt+HXuDOL4EPwzK0dpAbMhnZN/U4cVos0MVYUiwXQTbsvMFwMWcdYG5+IWTIPmj
 fw2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9WMDBZljuloQQnhE8gKAo0aHcQYcvjNaWCDBJdWxM1fWz3ZxbDWfV0HYGa5UYZ8uULZYciVwbfHg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOPNSkGcRA3Vglc1XpmV/R4tD0ZAdKNVhvxYO/s3FEHzKwIhdg
 ZYcV/KUyc3ahLSaLvAdrs9zColWDAzhKiKociF45QMvilaqfKKv4vfUA10197HnO2s15zXlFigT
 KcPaKaCbTLRb9C6k0GcKIKGEfVtPvC9gtCvvBL32uoL845MHFUyJUuj1upj8z8LV1GTwWmm8=
X-Gm-Gg: ASbGncviDVawTFvVVI7jcEj97NP+w68Ptlj6xBwC8zUfuaMYF26+dbvy2R6AYXWaS68
 DXK7aQVh+IsVU0O4aL0E4SxOLNzKLfAJT2NyZQTSKw6aVlGFFRbyt7zlKTWpCcgJeI704texRVG
 Jz7Eurg1xmPqJzv/ON2l0eFX8c2Rgpbv3yOy4xXMtY1pq5bacTIT4cHnUiqdighiZbp9cNcmUTD
 X2X9q/dyT+cMM3JqYMcxBtJKK02qNh/nd9/ra+7iObFE9wP0nY0ZaHaBVi6y1BWrX9sD28/Ilf9
 3c28ojyvcsUkITJrG566CbH9Eg9G8OzuebEde9kBF3GcBWzaGXhQRBJxpSGAhIiWwq4mYepdZiC
 LNtygRh5nYpPGT86GppMCImcFdvCaVNQ6opDXcn91VNzqKALJ/Ao0
X-Received: by 2002:a05:6808:509e:b0:40d:75bd:69d1 with SMTP id
 5614622812f47-431994bf2b8mr2318502b6e.7.1753880890773; 
 Wed, 30 Jul 2025 06:08:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEreN+EZPMsIb55Cu4XOPM4kHBtS5bQnw9CIRJxKiJf+cZor2FwqzapYkfyd+2FT5moObUVmA==
X-Received: by 2002:a05:6808:509e:b0:40d:75bd:69d1 with SMTP id
 5614622812f47-431994bf2b8mr2318193b6e.7.1753880887445; 
 Wed, 30 Jul 2025 06:08:07 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b79c32a10sm497780e87.106.2025.07.30.06.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 06:08:05 -0700 (PDT)
Date: Wed, 30 Jul 2025 16:08:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, lumag@kernel.org,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: Re: [PATCH] drm/msm: update the high bitfield of certain DSI registers
Message-ID: <nxayk52mhisyipdsbf5rykuynpg45mk5y5ykqxh76vzyxb6exy@h3qwqdgviumb>
References: <20250730123938.1038640-1-quic_amakhija@quicinc.com>
 <74e3836e-af29-4b5f-b644-23bdff084c78@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74e3836e-af29-4b5f-b644-23bdff084c78@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 4rBeR12E6mSJ8o_B4uz8r9uRWOiTtW6M
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=688a193b cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8 a=-gjihLczPamKDhiB-eEA:9
 a=CjuIK1q_8ugA:10 a=rBiNkAWo9uy_4UTK5NWh:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 4rBeR12E6mSJ8o_B4uz8r9uRWOiTtW6M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA5NCBTYWx0ZWRfX+8jWE0bBAKQM
 rgc5N87OphAtKAvJhhSexH1MRbt0DEKpN7ZppHZWDJayLx/e/PEJZQYeLKBZGgEIX1n8B+bfbjy
 J42aRxiApIAVQkCJmoyaw3NVDCpMMsvmEoTH9ciwi0YpUWCJock7T7XaAGp2bGba/n23E6x8VMz
 h2ajIEZK9qqVzaJpdL+xDCZIi+6ugDmPN54hv+HclxyfD4qoMCjO7rOOjXrDNdcD3SN766DyfvL
 /h2yyABU4A5xDsuE8oKIfsKn3xp+Kx4vR8BejwHxrg7seOsQ7XOodOE789L7DM8CstC/HWp9OhQ
 om4oWTuAPKkshpN45bmo8r12m8EFQHJPJ2ZjpqyVYeHO9CggNWNGOiQt31vQn4LCitO20qSRvQf
 f3JXGDZRVOZ5hXTuJ5pe8tvLYWqYbRj/CER+3JQkalzNi1bgpKd2q6J+RMxBBrbsGWMC5ZpY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=931 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300094
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

On Wed, Jul 30, 2025 at 02:45:13PM +0200, Konrad Dybcio wrote:
> On 7/30/25 2:39 PM, Ayushi Makhija wrote:
> > Currently, the high bitfield of certain DSI registers
> > do not align with the configuration of the SWI registers
> > description. This can lead to wrong programming these DSI
> > registers, for example for 4k resloution where H_TOTAL is
> > taking 13 bits but software is programming only 12 bits
> > because of the incorrect bitmask for H_TOTAL bitfeild,
> > this is causing DSI FIFO errors. To resolve this issue,
> > increase the high bitfield of the DSI registers from 12 bits
> > to 16 bits in dsi.xml to match the SWI register configuration.
> > 
> > Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/registers/display/dsi.xml | 28 +++++++++----------
> >  1 file changed, 14 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/registers/display/dsi.xml b/drivers/gpu/drm/msm/registers/display/dsi.xml
> > index 501ffc585a9f..c7a7b633d747 100644
> > --- a/drivers/gpu/drm/msm/registers/display/dsi.xml
> > +++ b/drivers/gpu/drm/msm/registers/display/dsi.xml
> > @@ -159,28 +159,28 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
> >  		<bitfield name="RGB_SWAP" low="12" high="14" type="dsi_rgb_swap"/>
> >  	</reg32>
> >  	<reg32 offset="0x00020" name="ACTIVE_H">
> > -		<bitfield name="START" low="0" high="11" type="uint"/>
> > -		<bitfield name="END" low="16" high="27" type="uint"/>
> > +		<bitfield name="START" low="0" high="15" type="uint"/>
> > +		<bitfield name="END" low="16" high="31" type="uint"/>
> >  	</reg32>
> >  	<reg32 offset="0x00024" name="ACTIVE_V">
> > -		<bitfield name="START" low="0" high="11" type="uint"/>
> > -		<bitfield name="END" low="16" high="27" type="uint"/>
> > +		<bitfield name="START" low="0" high="15" type="uint"/>
> > +		<bitfield name="END" low="16" high="31" type="uint"/>
> >  	</reg32>
> >  	<reg32 offset="0x00028" name="TOTAL">
> > -		<bitfield name="H_TOTAL" low="0" high="11" type="uint"/>
> > -		<bitfield name="V_TOTAL" low="16" high="27" type="uint"/>
> > +		<bitfield name="H_TOTAL" low="0" high="15" type="uint"/>
> > +		<bitfield name="V_TOTAL" low="16" high="31" type="uint"/>
> >  	</reg32>
> >  	<reg32 offset="0x0002c" name="ACTIVE_HSYNC">
> > -		<bitfield name="START" low="0" high="11" type="uint"/>
> > -		<bitfield name="END" low="16" high="27" type="uint"/>
> > +		<bitfield name="START" low="0" high="15" type="uint"/>
> > +		<bitfield name="END" low="16" high="31" type="uint"/>
> >  	</reg32>
> >  	<reg32 offset="0x00030" name="ACTIVE_VSYNC_HPOS">
> > -		<bitfield name="START" low="0" high="11" type="uint"/>
> > -		<bitfield name="END" low="16" high="27" type="uint"/>
> > +		<bitfield name="START" low="0" high="15" type="uint"/>
> > +		<bitfield name="END" low="16" high="31" type="uint"/>
> >  	</reg32>
> >  	<reg32 offset="0x00034" name="ACTIVE_VSYNC_VPOS">
> 
> FWIW looks like at least on 8280, ACTIVE_VSYNC_HPOS offset = 0x38
> and HPOS doesn't exist

All registers here are shifted by 0x4 for historical and practical
reasons.

-- 
With best wishes
Dmitry
