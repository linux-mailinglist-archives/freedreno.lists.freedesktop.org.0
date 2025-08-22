Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 171F0B31508
	for <lists+freedreno@lfdr.de>; Fri, 22 Aug 2025 12:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E681810EAAF;
	Fri, 22 Aug 2025 10:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HMmZqA57";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD49410EAB0
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 10:18:40 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UIBF024018
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 10:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ac+nVSgZhDM7Uis1Ey9g1tmw
 QUcK1Fk95dUsNGYgbrI=; b=HMmZqA575k8n3YhX6PcQxSn38iqvxUNcQb6kB9vG
 qJZnkJdCfkpgNlGOXYAvJ5cBZESzZbRy4T64X1vaeJ7tJ2/Y6Sq+JvTwAMf0x3kj
 R70nf+edQxTKO2Ah+pnqAymz5q7n0tW7m3ANPgxx5DTARJWzaNG2JuDoKot6DNgh
 pEPW3Q9r4o2aigN+atDqaeVbBilW9W3tiPIVVtswRH6feiuClNuUKotBx+YusC7K
 FgLB4ZlMt9hYxAstBTK/wdrCRIg/YGaSzHiT3A2901ygsc4deZ9SPHDmm7olcgDU
 deeE8APVcu4E/5ynu2PqqntlgmYiq1noPAeUfvnQrqIMBQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52agwvw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 10:18:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70a9f55eb56so40873036d6.2
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 03:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755857919; x=1756462719;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ac+nVSgZhDM7Uis1Ey9g1tmwQUcK1Fk95dUsNGYgbrI=;
 b=AHjAuz0drVMLRaAuGlDA1TmX+ly4f0B9mYa2E/xIPHQw7E1vJoxNnBIYz6oBv9sw0x
 FSRMzvDrMoXfhGjt+eqMU70dtWABjGofC8bzTjUIL7ax1B2cVUcimBSAN035F/Jj2Zy6
 xsiCbRdWrtEAe06qCSgUlKSfgbBYJhv2wNGJA3vQhN+CNCo5pAymgkrAxxdGxAoCUKhX
 qu2VTwGgSFfyi7xB/kuJ1Duu/xM18TRtZqtVi+TrmKxBrIzosb5uWQ9mcHTMkGEXcxoB
 N2rIbbRTg4z2J525Nof9vRXrBtwt1y1npw6HjmPeqS/CH6Zl5veU5mrBeVKDzVYwH0CW
 eUUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0059vaFr0od7nBrPRrl4pbo60SFFBo2iL18nwk0uBCJuo26RfYX2DttzdCrsFx5MBey9GBRLWik4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywf73zoK3u+prRs0wew/BoHLV9XfcdIC8njKbYt/BwYPFbg9IJa
 eQ+fOjsNEHRZTV6Ls19SPRSw1uQ+ee0lmYrfdD3sxJGcHq9IxUthdY4GhLBuajJGdsknHp0Q0py
 pWbC55KWwdf5lk/pm/rhUF75M4Ge96xWeXGf4bURwfy3gVS/1HKDRQZ+uaANbu/F2+ikNpGw=
X-Gm-Gg: ASbGncvQlNL3sWgEhmjGkCQ03tE6JUR0lgDjBwlA4mCPHXYK9shu/+MHXCWfC2a8GWj
 FMYlkHNSkRvsmGxYLqwf5vCVivesg9OXiSmmhIQ/i1/iZtVZtlzUlRQA1FZvlTHSw6epIW6BHbd
 9KnNu12wlOJmmiHX9ZB4cYs2cDTGnfiCm55WIVkSI9HhHkxSm9geTXAHP8InLDO88Lu9lUMFvGw
 fgZ+Ydj7m9j3mWNqMcLwtZJ4I4RPswTG3jLzl1IlORc77GmsWH2qfGZ85VfSHd7m9gwfBZDtZ6Y
 vYfdquxwJ391SOfarqHuUtacj13W3qrpv7r3ydga+6OKuP3Nlw/SRSZrQnTv6ivBfotjhWeXcQb
 vmztPADpGjZxbS1QKm/taeMvGZGOPcoPWrt6mT9P0xX0UMYiYj3s+
X-Received: by 2002:a05:6214:c2d:b0:70d:6de2:50d6 with SMTP id
 6a1803df08f44-70d97213470mr26722416d6.67.1755857918721; 
 Fri, 22 Aug 2025 03:18:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErGePoMT5ywVRUZa2kbz8ENiaVTNjGMFIKjDHTl69Ij615Bvp3AsW1z97fsCHMLNb7j64twQ==
X-Received: by 2002:a05:6214:c2d:b0:70d:6de2:50d6 with SMTP id
 6a1803df08f44-70d97213470mr26722056d6.67.1755857918063; 
 Fri, 22 Aug 2025 03:18:38 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef4345d6sm3418726e87.150.2025.08.22.03.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 03:18:36 -0700 (PDT)
Date: Fri, 22 Aug 2025 13:18:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
Message-ID: <armnr2vplar2fppyxgkxeaywdlgjts3jmf3qmirwvyh5qb3bra@treg7qeqz4j4>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-3-97d26bb2144e@oss.qualcomm.com>
 <95fed1b1-8359-4221-8245-dc12335dc4b6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95fed1b1-8359-4221-8245-dc12335dc4b6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: RJAoV9y3D9K-32eylu05V0RPUOD5kfgG
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a84400 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=9lylJ45cP0l75vQ64wAA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: RJAoV9y3D9K-32eylu05V0RPUOD5kfgG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX6JszTwRTibAL
 HXUsEuEWsMNkA5/wGAWP2D3oTMi+WMqTENlCDLeiGgFHSlTNfnr2OfX3IYwtqCxoH67lcIvHb0k
 fM5dxJREFSxNTKk3YfOqKgv1K90jSEP0uGXv8krJn7qdnJYQ20ItX+sl3RVmDD1QeD2acPoAtoM
 7K+jzceQXSWGHE3QPRj2fMiw1l7a9w5hu/Bu2c5Qz5Iip4m3azEGUGcl3zGXHPn48qEfUKhZX1E
 M5B2b2OwHHMquaBCvgEvQtiL2oAzAKBvW8MzqV1nR1UE70F/7k4QklQurWb41hqSSk9qIqsYqRb
 uNPQomhemSs67K0I4ehFu/JIhyzcZpiPczXdrEIvXB5kpTSuYsy6Kb5SQY4esRBxG9tO9aUS7Wi
 2sOyz9aqdve7HHQGDryK0h1gRTLVdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
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

On Fri, Aug 22, 2025 at 12:36:47AM +0530, Akhil P Oommen wrote:
> On 8/22/2025 12:25 AM, Akhil P Oommen wrote:
> > From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> > 
> > Add gpu and gmu nodes for sa8775p chipset. As of now all
> > SKUs have the same GPU fmax, so there is no requirement of
> > speed bin support.
> > 
> > Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Dmitry,
> 
> FYI, I retained your R-b tag.

Sure

-- 
With best wishes
Dmitry
