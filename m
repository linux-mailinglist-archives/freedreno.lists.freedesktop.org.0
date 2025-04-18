Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C72DBA92E92
	for <lists+freedreno@lfdr.de>; Fri, 18 Apr 2025 02:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8322710E1A9;
	Fri, 18 Apr 2025 00:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bWHSHncb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE2A10E1A9
 for <freedreno@lists.freedesktop.org>; Fri, 18 Apr 2025 00:03:26 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClKlg011884
 for <freedreno@lists.freedesktop.org>; Fri, 18 Apr 2025 00:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=jJkocawK74IHVR8GG2dYux9L
 W2UbP5wOCkAP2RU5Rpw=; b=bWHSHncbmPt6gikdLZmn1hyrWc0tm9hKLyenD2UF
 lshwKyh6ufPC+1ezDuhAOcXZGnfhOwo4CLMtQYAgU2kV4ShVqCSvCfYXW7A/2LyW
 BYWops45xStt4Yaps3vvBnmr6ciPF/LhixIctgQt5yuQuk3fSp/tkzzUkh/Nuiiv
 65w0RYSnkd+axqZpjNY6fdNgixFPYnOwjuU7HIzkix8V6U1ovIMvW/StzfNPbS9+
 g8YHOu/E5M3qFYlin/30kFNT5G3S2adUtLQeeqF9P8Opx/lGo5Z+PUCg+/Oj0YKP
 lYF+icWgyV/SFO73vVd1dawj1d3l095re5/ow88nxFm4qA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vrn8b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 18 Apr 2025 00:03:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3087a704c6bso383403a91.2
 for <freedreno@lists.freedesktop.org>; Thu, 17 Apr 2025 17:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744934603; x=1745539403;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jJkocawK74IHVR8GG2dYux9LW2UbP5wOCkAP2RU5Rpw=;
 b=Zsma4itX6BC8uYSYR3Ujwr/0Sk6oXvYVZo6jkydFahAMrEcpjeDWxIq2Uh3fjKcrVu
 HPuWcSU0kVZ+oyZNWRzlp37uimZSeMqYkUv2cy2+wE2lgwmnb6K/JmylIjeBI8DUBnM/
 AooDqBpNv0SpFKphDcYEc2sfY1md5RmeFHeOE8jUHqBYAg9y+sFWIIamTnYI9cKvtDeK
 rEMtj3s3IibALb16YtOwvN9TJZb0Ln0c7aF5bXgPbglka2EmipA7wlriys/MeaDixpQY
 qUKILwpfchEpX8YyHcYrgQ+8CVudzucJQUm+TXhOrNYihTg7ku09gJy515Y7wWrSYJTX
 8RBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmUt1PyUG05RfEF4Q1dvbNcICuAw0OQaKV58WFhHhSnWXONJhREnV7gs/mFodotsaYB7DU0SwktNc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJFS/0nO0aSQFv0iS53sPWKsPje3AE4Ijv5yNBKZVUzyknJY38
 km6ohDwhpCmfSOrKX+nUHsjV51LIgJL3ealFfCJktI3gzQXV0/oQH4JBgyvoLW11SnwuqT4AcjC
 74WuShxJSy3uk0Y0sDXvjlrLDh6WQ9OQe5EJgHw/C9Re29saHPHi3/vb+J9c4PAO/TOXa4JhJUJ
 xhhXwqUsBnTpTc7k//1pKCs7XR91IwlHot5fN4bUixAw==
X-Gm-Gg: ASbGncuBYDTpuZ1y0tqQijJYR1hYQLs0cO3Dj9845jYW/8AL8bhep6IBrSuyHdrigTM
 caZ95STApRKYXwPQI6HDQIx9CYQuk8GoPAOJ56tdNdVSF9dilwoBvR5T1KVO3TaeCgUa9e/6QL5
 ErpChlfIEjkqznLFkOSnypsQ1qcQ==
X-Received: by 2002:a17:90b:2807:b0:2ee:ee5e:42fb with SMTP id
 98e67ed59e1d1-3087bb4d0bbmr1348834a91.13.1744934603059; 
 Thu, 17 Apr 2025 17:03:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt3zEHzT/caZi4wnZ175L8zlXV3e1qMB/QyXjcrkOHqa4wh1gNr+1LZYEHvAQ/csu/mkfLj9QPTnPMCwx+vTk=
X-Received: by 2002:a17:90b:2807:b0:2ee:ee5e:42fb with SMTP id
 98e67ed59e1d1-3087bb4d0bbmr1348781a91.13.1744934602616; Thu, 17 Apr 2025
 17:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com>
 <20250417-sar2130p-display-v4-1-b91dd8a21b1a@oss.qualcomm.com>
 <20250417-arboreal-turkey-of-acumen-e1e3da@shite>
 <7b559f03-f131-435e-95de-b5faee37b4d5@oss.qualcomm.com>
 <a8f7f571-e81a-49d6-a40d-895960165039@linaro.org>
In-Reply-To: <a8f7f571-e81a-49d6-a40d-895960165039@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 03:03:11 +0300
X-Gm-Features: ATxdqUHUTgGLYvTODPooo91SkskG-gwTNA2jG92kWlujJbztIUTMTuUwe0XuE_s
Message-ID: <CAO9ioeWgtsTtMmqm4w4KTYYSVOWpj1Sgb6D4oy+54wBHU_DZ8g@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] dt-bindings: display/msm: dp-controller:
 describe SAR2130P
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
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
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: G-IENCpZZsIOlfs2TqHKD5k_KcRT9GKZ
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=680196cc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=ni2JVXtQXpgTILOyzusA:9
 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: G-IENCpZZsIOlfs2TqHKD5k_KcRT9GKZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=605 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170178
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

On Thu, 17 Apr 2025 at 15:04, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 17/04/2025 13:12, Konrad Dybcio wrote:
> > On 4/17/25 8:03 AM, Krzysztof Kozlowski wrote:
> >> On Thu, Apr 17, 2025 at 02:16:31AM GMT, Dmitry Baryshkov wrote:
> >>> From: Dmitry Baryshkov <lumag@kernel.org>
> >>>
> >>> Describe DisplayPort controller present on Qualcomm SAR2130P platform.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>
> >> Addresses do not match. You re-authored the commit, so now everywhere is
> >> mess.
> >
> > It's git's fault with replacing the linaro address based on .mailmap
> No. You can easily see:
> $ git show 51a6256b00008a3c520f6f31bcd62cd15cb05960
> top author is like you say - mailmapped, but Sob is my @samsung.com
>
> $ git format-patch 51a6256b00008a3c520f6f31bcd62cd15cb05960 -1
> What is in "From" field? Samsung, not mailmapped.
>
> I believe that's a known problem in b4, already reported. I don't
> remember if this was fixed, but till it is - you need to use some sort
> of workaround.

No worries, I will resend.


-- 
With best wishes
Dmitry
