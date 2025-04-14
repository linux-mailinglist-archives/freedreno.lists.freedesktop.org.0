Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 084BFA88027
	for <lists+freedreno@lfdr.de>; Mon, 14 Apr 2025 14:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C581B10E0C2;
	Mon, 14 Apr 2025 12:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZNnmEjje";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3549310E11F
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 12:14:21 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99qZ1016544
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 12:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=bGrXNa6dHXvr4kroK+MTw5NQ
 iqX7zWwS0Ak/+A0yv10=; b=ZNnmEjjePUV+BrjhfwfZTyG1deE26VgjPzjuXCo2
 YWBhbuGcHoo2EGQ7wYQa84DJiFY6uKeFTtqeAq2pA4PidWV0R6BqXsNcSSbf8MBe
 YF0B3Y7ghr7H95bhvH9LgPrqCSdABJrEiOPd5UpukkduE75MokYhKwkrc6nQwGON
 1WPuc2Z2hQA1rfj82vrIGp/zNwzMH2ygBfWAFOtNX7k6ch8kF/5ijpbVTnYBZTwi
 njM6B/f7Ox90/VGAKNDEnn+Z7cORaoJQxSkMSPUzkunN++eE+slgLMUCYwFYX4RW
 gTjDEUB0NwlU3JemWDeeJiW8oyF+fZxUNvumTEkU/zMIuw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf69mhuv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 12:14:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5750ca8b2so678037185a.0
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 05:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744632858; x=1745237658;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bGrXNa6dHXvr4kroK+MTw5NQiqX7zWwS0Ak/+A0yv10=;
 b=uCkBZ4UmqsNoM59tVcniDImgMNSmu8s72AqH5k366UzMMssrEVeiBdAuOwPqYNbli+
 wq2L3WRohdwH1asOy9hWYpgtCJQXf0uLiwawsV2ux6FAACAy0OJAoE3wDcS5FlFRRsvd
 b02bs55RmZ/jHEzbRcBt4q0Hof+6oAszwfwFvhlEI4YU6p6CMf6oY4MkqA1S92NeijyD
 TfHfl0hYZxdYER3C479RC4TSOrdQQCTfuJC6jDooM9CMsy0396XtYe2GFHgzqKBQBuII
 iOUJJPg0ofPiLn5yDIooOL3bp4ogOWh37xSvcmJxQQRzM6RKYWsorhfjo0TpxFKjEKYo
 jSLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlatlv3qpHr5SNhfxbeUu17/jqVVHUC6qNNu4c70p36D9ML2DuUF3tTlKoeBnlRwqPVXQEYYu7Qy4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweMzVF5W6D6BmPFwZflWR8alY/OlqxmsFgRGI7FSBSqRq0rGs3
 t9ANdWpemzpxT+Jd7YnbYFXnzuZvGzN/7tQ4gcye6JdT/bSPG4kWY0tUSLn00+elG6dB+FdVSoo
 JN1BA6i0WW1hsq/zRUvF3O1vdUcxvdxaKkFIzjl6afXeiH67LOx87rxnu8wDNFLJaZqE=
X-Gm-Gg: ASbGncuDFwFqfxT1BCPFSnELvF6pwY47jrw77E92PuBHGrrF9MzZUIMgmVvSxMsxD2a
 Rtlui1BY3a0pHKf7nRHXli7kxsAw4S13U4VftOvimr1cXq2m060RwGSMTV1aveuTK8xbcci66cF
 aE0XxAmq0lqr5C1M8HTZVsZUZeNcrkErfwyHc+OYU7IEPJyeJZNlOCKnVqm4MT2+FU5urpee88l
 a7n7neUN6vlduPu7MOAi1ByaFOjSxWisF5EeDKtRSodEXbx6t9mxPd8eo4nL5X5diDQX0rZY3+s
 fVpBR22B1BByhfkoFIUtHYIiNWXooFVeyCM46ui9tDstAS0WS4kkCiUwB9M3p8EjM4593JEAeAU
 =
X-Received: by 2002:a05:620a:40c7:b0:7c5:4001:3e9f with SMTP id
 af79cd13be357-7c7af0e0f5emr1701933885a.29.1744632857835; 
 Mon, 14 Apr 2025 05:14:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxzp5iYZiEnUZWE3gvlgW+sXTiIEbnk35cNdFG+zRQtIEUe8+f5w9ReiZy8l+u4jZmVg+wwA==
X-Received: by 2002:a05:620a:40c7:b0:7c5:4001:3e9f with SMTP id
 af79cd13be357-7c7af0e0f5emr1701928685a.29.1744632857299; 
 Mon, 14 Apr 2025 05:14:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d2386b6sm1128164e87.72.2025.04.14.05.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 05:14:16 -0700 (PDT)
Date: Mon, 14 Apr 2025 15:14:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 10/10] arm64: dts: qcom: sar2130p: add display nodes
Message-ID: <fd2dtxhbfvgpiwy7rc5z4hrrmuthet7bmp6iespdcvxgaz5uhe@ivg2gun7sb6q>
References: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
 <20250314-sar2130p-display-v2-10-31fa4502a850@oss.qualcomm.com>
 <c14dfd37-7d12-40c3-8281-fd0a7410813e@oss.qualcomm.com>
 <umhperyjdgiz4bo6grbxfhe44wiwoqb3w3qrzg62gf3ty66mjq@pddxfo3kkohv>
 <8fe8c0f8-71d5-4a85-96e5-17cb4773820d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fe8c0f8-71d5-4a85-96e5-17cb4773820d@oss.qualcomm.com>
X-Proofpoint-GUID: FKsywsvXvL56WPdQJy2swuJ8oQCFGCE2
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=67fcfc1b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=nRcdhEhJI-3p1s1dT_wA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: FKsywsvXvL56WPdQJy2swuJ8oQCFGCE2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=650 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140089
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

On Mon, Apr 14, 2025 at 01:39:56PM +0200, Konrad Dybcio wrote:
> On 4/14/25 1:37 PM, Dmitry Baryshkov wrote:
> > On Mon, Apr 14, 2025 at 01:13:28PM +0200, Konrad Dybcio wrote:
> >> On 3/14/25 7:09 AM, Dmitry Baryshkov wrote:
> >>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>
> >>> Add display controller, two DSI hosts, two DSI PHYs and a single DP
> >>> controller. Link DP to the QMP Combo PHY.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>
> >> [...]
> >>
> >>> +			mdss_mdp: display-controller@ae01000 {
> >>> +				compatible = "qcom,sar2130p-dpu";
> >>> +				reg = <0x0 0x0ae01000 0x0 0x8f000>,
> >>> +				      <0x0 0x0aeb0000 0x0 0x2008>;
> >>
> >> size = 0x3000
> > 
> > Existing platforms (including SM8650) use 0x2008 here. Would you like to
> > change all the platforms and why?
> 
> The last register is base+0x2004 but the region is 0x3000-sized on 2130

As I wrote, this still applies to other existing platforms. I think up
to now we were using a mixture of 'last actual register' and 'documented
space size' with VBIF using the former one. Should we switch all
platforms to use the latter one for this region? In such a case I'll
update this one and all other platforms. Otherwise I'd prefer uniformity
and still use 0x2008 here like other platforms do.

-- 
With best wishes
Dmitry
