Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE2EB31681
	for <lists+freedreno@lfdr.de>; Fri, 22 Aug 2025 13:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3DB910EAC6;
	Fri, 22 Aug 2025 11:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OiaUG0Bt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744AF10EACD
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 11:42:28 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UGwe005738
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 11:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=KAhSD2vjv/ePHUmD+gzyEEp4
 2L2WxYKoMwQm05Sn2Yc=; b=OiaUG0Btg4yL0nRWgSNlhwZClARkvbc61cx7zd60
 ACHg8wc7y11jD3eOM/32pUXH+TVk8km+31XcXZjI9FSulMPjp+t2vo5CuE1EPTc/
 XJVsEUCoRTaafNgdnv/eSPRvzLpVkMczXOoMoj4hZARV8yJOGV/AZL8F63otkVpA
 z0DppPkqHX413v8iMPvxF2ZqVDGWZ9nwDGzC1E5Zm20V4bz8r113YK4RrDj7VChB
 jpte2SnZs5FytqPkJObC0CkPcLRz30JurOImTJv4Bz0bwS2OcshjVku77l+H8s5s
 RXbqlJ4FYde8yKvsJ7zOnzJCullQPwo+FJdEU03xA+rPDw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52911y3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 11:42:27 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70d9a65c239so12205496d6.3
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 04:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755862947; x=1756467747;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KAhSD2vjv/ePHUmD+gzyEEp42L2WxYKoMwQm05Sn2Yc=;
 b=DLYCJ+7cfRhjU7Mc+fEQz4Mcm0n403FOMV8cJam9OJO9J/pSn+6ZwYGWJqga8K5Zbj
 XIPW7v4AVF1eV4hz94MydzLzdFen9ddmyAfxuWWUCL7uRyG7acdgei/HTT2OgIdPJX3V
 ZIw4YQV9PKCL9FnDE+MYZReQp0v5Nvqz3eVJoiu1NMCfr6N8X6z/OjJjGnPchCpO5Zg8
 Kppapge7ZgzPtsTRLuPJ8ufHnvroEn+ZpxouiPagM7n7glEBdih5Q/FuSxgGd/XSngof
 VyliRxjb6Sgxg1fdEvMhq3mUJ1pvi7t0LninWN0gaLLm0h/6GWHqEGa0dwpUxPeuCTyp
 dccg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDIkjh4g7KB1BDGRuAEOCt+keGoqfa27D69uuTBk/ahE6RoeQ0OuQB0ONt8vJfZhIaux7tZD29KfM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKrGTu4OWZKx2UaQFA1ROGAR0l3SWjATs4dXEdGkmm5ylvIO+8
 SyqlxrMOGMAlt0EsQ3nY2Oj8sCxMHA0EynU/P0Ia7xgpKzAoF0Sq5T53NnxPc9ovFna28kR8gA4
 lWGSDXNYCQQspccUSI09Psc9F2TYISaf3OAhSyGGrWBBQ1f8Ols+pUgFmE6dfk8+HCXyIxX8=
X-Gm-Gg: ASbGnctrQHLSC2X6BXtkB510Sl3Gs5rpfFptpdkCLuY7YB9d7rmAoAUTfjllfoZLHWw
 gYLgIgKYepW6lFbcWb73uyMI0295R8zOAOlgWGgPe1qx9jmt5T/sOs0SpkbZaVjTtHQf4hRtoIq
 IciFeoP6oMNPt8SOPoI6XBrthPO9qiMkPLTXbb3Iie02Xbjw5iUnZnnqszkcC0IjuzeEx6j4Ojn
 cqOuNQKxuq/csaXt6mPQ84jRkrtHVqJWURkA34Uge2ujxV6xEgvN30M8VzoDjSk6nEIArQu1frg
 E1/I7Z0a4Jq8WtMVumuI1tHh2IcEi/2hPjWV9BWjZx8DQ20zwfCrSlYBI1SzcfHtT2fB0LYxCDS
 CRMeI0tpvbJmly0PSPeyuiWe0omKT2nYurde2GFCMpszzA4jAAU35
X-Received: by 2002:a05:6214:628:b0:70d:47a7:72cf with SMTP id
 6a1803df08f44-70d97124af1mr30644896d6.24.1755862946605; 
 Fri, 22 Aug 2025 04:42:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDtB7Zynj/rf/xXI0GvnluKkqYde7D50ORiC0miS2xPMWbtzXkTpNJzvnsT5Gfpb6b73VP8g==
X-Received: by 2002:a05:6214:628:b0:70d:47a7:72cf with SMTP id
 6a1803df08f44-70d97124af1mr30644576d6.24.1755862946133; 
 Fri, 22 Aug 2025 04:42:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55e033fc2e8sm1537277e87.59.2025.08.22.04.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 04:42:25 -0700 (PDT)
Date: Fri, 22 Aug 2025 14:42:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
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
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/6] drm/msm/adreno: Add speedbins for A663 GPU
Message-ID: <atomptaspsr7cfmqs4v3lr4lgeufbwq7jqz3lf72r2rxhv6emg@uhx443xvylz7>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-1-97d26bb2144e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822-a663-gpu-support-v4-1-97d26bb2144e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fpOFpF4f c=1 sm=1 tr=0 ts=68a857a3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=EbwLtv1J8F1BF5yYxN8A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: hgQPwifkvgMfQU1rtcm6h7rc22PJWIwt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXyPNkduMfDNhr
 20GJIzE74P2eN/AzFzVML+zMLuj5HgEm9mBXkuGNkG2Tdtclg1HMAPqaFZI48VdQfhfiJBWlA4v
 +HB8VRLAa6qMFBfkcqrTkPiwzCkrm7wVcYn4IFezuHqhR4i4p2MqYP6/Rg95EBzjSOgjRPc6efX
 ELHB0vLBXAcnQEnF1xPctekkTInJrZXnE5Cf354E3518yALCHn/5duZ73wtR4GskoXY9AZUuoAg
 Y4gY7EI0CplfCHPs3IoBDdBrUsDYgcgpcHneN5U3wM7LC/Mgt4IFr11Y2PbUAmtHRVYa13M8Oma
 obykjzigUreTv9APMDMDwFb8EQRRlVtdjan4PJ+jlLttjLU9W7pn84+4v+JRUc3zAthVEtHu+Ds
 JMEsRkmiHVxck72d0qNfOegQxl1JcQ==
X-Proofpoint-ORIG-GUID: hgQPwifkvgMfQU1rtcm6h7rc22PJWIwt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

On Fri, Aug 22, 2025 at 12:25:26AM +0530, Akhil P Oommen wrote:
> Add speedbin mappings for A663 GPU.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
