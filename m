Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D23F2C00F32
	for <lists+freedreno@lfdr.de>; Thu, 23 Oct 2025 14:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F8A10E3DD;
	Thu, 23 Oct 2025 12:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ek4YFsd9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D4D10E3DD
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 12:02:25 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7fRXB011853
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 12:02:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=M81zeVL5vCT2BNHUGaKZfq7O
 ZSW446AfEB/X68ESVy4=; b=Ek4YFsd9WhBLUNX1u/ZkUa1H2LUhmwgQN02YkkRd
 DQVoXLd4/qTfR9ulGVsYZWj+fDOB2ZLUeLzmg/fFciUgkNc3dGDtmCorw3YrlCq7
 uVTMofWObMsEhTabwKctqFnEtFzNG98Ps5wTG1Gev3hseyR82tsxPj/mkqfEfzcH
 6PLAzLnuWE3L6u/0l8WpZ2DiG0XtSJ0r/eg6rhgvREEWwbkU8x8CYjhBIBoQD2Gu
 RYHA8fOuEQT+Am2W2HfXNYfhe/dmAbNrTkKyWnDBQ7u9MR8x87XZOQKfsBXK6Pub
 oEZT1B9hEL6sGHxTYH84mK7Tve4wBRgQ9qDHcVm7hKLb1w==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y524ag0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 12:02:24 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-5569a2b4244so371488e0c.2
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 05:02:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761220943; x=1761825743;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M81zeVL5vCT2BNHUGaKZfq7OZSW446AfEB/X68ESVy4=;
 b=upkhvaCOOKKkf1mJWdf0dFsx9VWtv1uMyR15i5q6VdDeOignHyPQQLG3D6CNfC6e7L
 eSHeVRKNOTZ5D7OcwrM0NQGQTMMDGbBNX4nKT1/pxWgswJH7BzMxfGrRh9lSmHII8qnN
 8KFWsHCM0g0v4GafxazRTYi9gs/hjB8519Vi6OhHMRZDs3KIn/66rpoYmh+nNS03wntL
 wlyOXu79gxXSL+02S11ZajDrC0BG+ZpUBdvG1j6zeIo5x5UsoHZkS9K+wBlz+KUs8eFT
 599JZP8CECoxhc6sH06W/NV00YI6ssYeDx80RNCyRollR6UNbo+nF8yJnM5IzejvQ99j
 uAHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhMBRdXB0XDNl5VFyXQPRYI/ZTb+j5aTo1W0p/NgsY92XmgUm3VMmclBrBhuuxltvFQF43V9XM1H0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5oHoSu+JmFriSKahxtVcolf1G3EI7BIAd8e+fVRwEvHYO7DNL
 E7YMt+tqZ81sFUUEpA5QczAd/WrYMu7HKG/st2VwUf96tJYfGzAm203jDMrz1DBOoMSzDoIl3CO
 7n8vCgWvjKObJwHun2b/OJkJ0XztQumAczWh+2hECWD707xGydL9JilEft+g9WRSBJB829H4=
X-Gm-Gg: ASbGncvyFQDBbsnhqeMAtZPIzBQT09jZARKGrJaBmG0onkuS2VHKynpOlQl9PoGdOoK
 cR5hFPzsjx/IkTCzzW31cRyJosxE5FNG3oEewu7TR2r62BA3YMX9m7HXxJ/YXxwvi7mS3KckeHd
 VWDiiVP3MdLKHpaLoxyCu6kZDUiYyfyx1+5deABr6dlOYFD+BTRyaA8/B6DKmewxfJhixgpFQ6S
 rOQKHZhNGMMA0ZXv4wEYlGS1Tb4Nt4Ed8tjBHUETfbqmI7w3ltFWT+rVdjrp/Kq58U04uweDe0r
 OKNxTBIS5ttJ4AgdjiPcCUu4Y6d8YBDO86gANu875Ei4mz1S++sY52YDW0l1fpzGofG9DJYox56
 CVaSpLADiASuvBWal6WQR9sCezEU9v89Eb2sEvaNRmRcQ7rrdNs1X6iflxq9KL3LxEEBjGq12KY
 08Cn+GsoiTsd0H
X-Received: by 2002:a05:6122:d8e:b0:544:9a46:7c85 with SMTP id
 71dfb90a1353d-5564edaa58bmr7102784e0c.4.1761220943396; 
 Thu, 23 Oct 2025 05:02:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeYf4cRCjfFBuC8sO6FcOxLi7vaZ8cGTF8QrhwklAMfIk2LsC1fPJF0Hqf+fYEtQZaBheqJA==
X-Received: by 2002:a05:6122:d8e:b0:544:9a46:7c85 with SMTP id
 71dfb90a1353d-5564edaa58bmr7096044e0c.4.1761220913364; 
 Thu, 23 Oct 2025 05:01:53 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378d67097casm4150311fa.22.2025.10.23.05.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 05:01:51 -0700 (PDT)
Date: Thu, 23 Oct 2025 15:01:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 05/12] drm/msm/dsi: Add support for Kaanapali
Message-ID: <trkt26sv7tpucjzgguv6ww24jsbs37ppimppyvhqvy4drtqtj6@uf3m3rcmrg46>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-6-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023075401.1148-6-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfXzJGcECkOeIBb
 VbKJsa0Xi9mfUQheIvaZtrCJpxR0CQhH2zba9NaOzAT+GrfMbdKPa+OPdwfwKqwoV8ve24Mk035
 uGvV6L7NnUa4JNlNKS2hCPE95p9wp03Meq5tSiHxfdnASJFgoqizGbGbrrw6wYKVPvFzJEbmqb5
 oPkMOOBq7XZAJZV9FKeuKmKmupGK1G4CVsVXhszXuXIRiGO46fa+TXcUo5IfmqkxUNDioYJlwyv
 ptfbshz/I8aR4tpfG4NXJVye+qow8TzDRPrp3v62mSb0/1J0MosKOmB6OObGSAQm2OFS1wy09i+
 xRcYRmte/EdDuN+WW9d3foDKuyeOLYtsuq5wwPCW+CnSXMrt869oJszSap+ncFZGSQgnyyW32+b
 iC+1yS56Kn+BVTUjoVxWUpWbjvBaLw==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68fa1950 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=A-_Rx2uNxy_47QfWGsAA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: VvwuSyiQPPh4uzi1z3wLMApZcBxmF4aj
X-Proofpoint-ORIG-GUID: VvwuSyiQPPh4uzi1z3wLMApZcBxmF4aj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155
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

On Thu, Oct 23, 2025 at 03:53:54PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add DSI Controller version 2.10.0 support for DSI on Qualcomm
> Kaanapali SoC.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c | 13 +++++++++++++
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
>  2 files changed, 14 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
