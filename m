Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A39D9BABB87
	for <lists+freedreno@lfdr.de>; Tue, 30 Sep 2025 09:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8635F10E4F7;
	Tue, 30 Sep 2025 07:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OOut8Vw5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B20BF10E4F7
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 07:03:00 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4Ho1u009650
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 07:03:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ZILBarotSZWQdM56LLJz3+w/
 7JscPhGYyLjRbrYgdnY=; b=OOut8Vw5yYRY4OGq48yBkocOurdwvVdz2F1lCt6o
 k2gP3wjxwc5Aysiuye2xQK2pZM1ndn2A08UC2m1ielc6IQUggOShqqOGyiZXadlm
 vhpKm7dbSBDU+VPSb/YE0XhgUHTUEqZLq+3yacne2pSC//8fyBfWbXLFqhlG7/p+
 3BuJ7W3TU6nEUBTYIdkpFLp77cyYQwCxCvZnvHAQTNtd97eHYTD9YylFAH8sBFA8
 lje4KKku7gcJcPdVJwW/6MMd9qL14cPT+Q0IGW5rpts3lhEI4sz1qEwVj0bYYlKV
 RKee9WgC1CRvh3/JcmNlaoeiMIOrdP0vRyclmTH5YulaFg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e977qrbu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 07:03:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4df7cdf22cbso73255581cf.0
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 00:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759215779; x=1759820579;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZILBarotSZWQdM56LLJz3+w/7JscPhGYyLjRbrYgdnY=;
 b=gB5zr20mqHPK3KyJ5N2ORu2MUTmhmDDBIK+BlCTqpTV/zdONWQcqOfFdwBsgIkE1J0
 aBjWoOnPuWBJbrutyMhI983Et5N+PpTP6xqK69H3yZY2x0EIgf8IwHy4GrBZKi3Mvkzi
 XDTMAgYqDH7+SOxmmyej0gGp3wD9S3XQXGss8MGMwowmsTzgbJjraxy/6d3+9j41YD6k
 ahL1/m1oDP2Kxt6zwc9NLim7zVsQDrRoRQoui4SjcT9y7k8ivLbo376qPro9CJCynDZ7
 hnnj9WdtIKsxXnNQnnXvN6zrGeMoIf3FQtg9WhljqMqOB+KiooDf124X3vFeb9k6IWCj
 1/SA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWE1d68mWwfuGJaE1+khLdNl866eU3aSSan3m09zydLZgMGBBUu8yLiKbQn9bA2zdj3dDtpYzViDSc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoehXMJJ/9E36Oi0+DDqRlxzksySj6MdBEEZmO8miUqjAwp7eW
 tddv1yG3jsGT/8h0JgVXuxy0a3vufGTetreX3omnwU1f4+jvyB4yfvJ+fjnX6gq+W2bXA4jCV7d
 OgWYqWd1/Z+C5Tb50OWUdfnQ7YRL7BIXOKIb60SbBWJFXOOuBwBPJ/29vGW60TB0gkyoJRoo=
X-Gm-Gg: ASbGncuuN+45kA+U+RAhJwEDbBbkS6Sy2XoZkQFK4jqFTElboCG8/9Dxjn0V69Q2mHs
 xfXEZjuhKQ5Z+Exxd7giO4jncB4bxtn7gbuDQv2PU21FbJcD6UuJyAAizrAFDag0DAdHs6S8AAf
 Au4QWBWZoPnvHHdrgVd3EmrNeDIt1IwEeZlGDIu9BBDL8oTPAsGYLZwoNvk4+vnMQ45Awjochr5
 K1E+sxhKdyUAcGLnvRxen7Nj0gwfhdTBJySQ1FjIXptqiA+VHgCcnptsbLbyI3ZTo3rtwDLCacz
 GKk89hHCqPhrMIhhhy6N8kmlQlDm0yiUxkytGn/lJ6WcSkAPdSX4zWXrsDRS9qpbhx/aWGmKd6C
 2Og1/jwZ71UJ5F+Y0bMDYrRLc+WVyrgDn1dSZRyQcDtYCPtxkuv9ahfb3Aw==
X-Received: by 2002:a05:622a:255:b0:4ab:6e3d:49b4 with SMTP id
 d75a77b69052e-4e27d7c1b65mr43578351cf.7.1759215778763; 
 Tue, 30 Sep 2025 00:02:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFA6lGjRTL6r8mC989qOKGIofS9wz03iYOMq+60qPx/pT9WrIKYNjXkEHiEux+C3IniYKpKBg==
X-Received: by 2002:a05:622a:255:b0:4ab:6e3d:49b4 with SMTP id
 d75a77b69052e-4e27d7c1b65mr43577931cf.7.1759215778195; 
 Tue, 30 Sep 2025 00:02:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5839329881dsm4325236e87.87.2025.09.30.00.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 00:02:57 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:02:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 01/17] soc: qcom: ubwc: Add config for Kaanapali
Message-ID: <yhcqj3beliary34msn6zbaig7j4krn32st37g4n3ey7oipswea@ckio3yjuwswo>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com>
X-Proofpoint-GUID: b3zjHh7J-pk223HLFgTC9zqCvIPHRKo7
X-Proofpoint-ORIG-GUID: b3zjHh7J-pk223HLFgTC9zqCvIPHRKo7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfX1rfztvj7P08f
 vWDSVoPDCxulBz2yk3AK1s8bkODwbM+HizXxi6P8tgYUL7araf8Ik2+6ksEDr3J4GqecFNEoz7Q
 pNzkJ8ti44/IAB7xWYqWpx48rOKLP561kYOulevsDz2OSN7dqCT8nXGVrVqz0kRGQywUF2MBOBs
 Jc6knf+JmEz1w7bfZGsSkw2UFXq1c1IIKMchHImRdgC3vzQPCDZTSnfB69JfH1L5LNzRP0y1R4D
 8zDdDn8PXvOFUUUJXaJMFD+7140Qrcnnsg9RLbPQo7nReWgDYOgevgVbBXe7/5WcyopJUSaoaHS
 UKMclHvF7zcYYtoDjHI6zkPAsGRZvaYbzI6JEK+Ag6LXepoWCIoabyfNsx2evHtxR0nE9YgTXdi
 o9tz6qnExbJI1+nYnB7hIHC07sjJ/A==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68db80a4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=_QbXVIGTKPyQLETMuiAA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043
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

On Tue, Sep 30, 2025 at 11:18:06AM +0530, Akhil P Oommen wrote:
> Add the ubwc configuration for Kaanapali chipset. This chipset brings
> support for UBWC v6 version. The rest of the configurations remains
> as usual.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 11 +++++++++++
>  include/linux/soc/qcom/ubwc.h  |  1 +
>  2 files changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
