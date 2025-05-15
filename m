Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B9FAB8D66
	for <lists+freedreno@lfdr.de>; Thu, 15 May 2025 19:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80DA10E91C;
	Thu, 15 May 2025 17:15:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SvgXaPuC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E7510E91C
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 17:15:41 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFNq0032701
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 17:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5fr5L04Jvh0L/+a57XtjIN1m
 EM6WQNUjAaFjioBMZNo=; b=SvgXaPuCTs3wDo9dlvBivEkH1Y+z1XI1YdbwV5CA
 vNKugsrGqNDqaFLpNYiwe0c6Xweww5MgON8Gw/LXV5XEkFDM/GM54ofNSrJw7zu3
 HufKmIYJNR+MOCVhF/R+CT+xMNvDuEamtcDkLc9TKneC6JvGtfbjR0stUPatw4sL
 SJ/dpJrOtJ54W9QshS1H3yobMaaxl9RBWrcMCfIp3sC+BoHNQ8lCSkytbYlE6hEu
 4U7SWezwFm9KfcozgU06KHkkjRFssaHL9o3fx7pNltiC8QvusFki3PHFExG82wk0
 PnrfGl71gQmrW+AbnMpTv3f1Ic1g5G+XHTwWp7z2AfAUBA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnxysf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 17:15:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-22de54b0b97so11946665ad.2
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 10:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747329339; x=1747934139;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5fr5L04Jvh0L/+a57XtjIN1mEM6WQNUjAaFjioBMZNo=;
 b=JjKuU16faGuoK7sNt0wMS7tnx4RHTjjwnh06gXgkfQRYa7jvEBeXXgUMzOSLEYgls/
 mcUQrBgfJy+fXuYDZvekgSEYwVPcN0s+OU0K7jvHcswJdKXDTMgKcqhEk1HdJnei3ATh
 opz/Op9Tu5RZEUbMzOWqwz5d9K3VJBGkTRcoPPcdmgk058JvXZLDF4YXxtkkieBY/vZF
 T3Bhe1cPAxgbaVxoKLMU7WAiIHPx4iPFd7cZitJEzPIUTb98rMo7a57aF5Zbr/8+hfwN
 YbAogKNh1r7muaPxw8z2nef4nVH8uwOLzeJYNtraBk5hRPhgkgskYuF7E0bjo2ebSM2G
 9o0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+nBbfOu4PYBLQDrqbTIGBUYAO9dkNdHnHXEzOXoiJJNkII9OyaRojatdRXaGD2DLGZFnKrnyDwmA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIQNSSmjFfC3XWVYETFpM2YRpwrL0AOt+Rz5LTKgVaNnCEHz0Y
 1HMP3OTPG9vlXNLw3lPX5pHLG4RczjaCkY5htkAHGNvWgzGSQCT5n1dT+QQ2pCpTS6V5Gk4ec2/
 MvL1hYBwfZfpZp3kB0tbANDHawgHWmfKteHiLVMr9Iq+1DwdL/VVJEmlRn7hP3LZgNPwpNPh7Xl
 TYzjNvdwsfE+iiwS5H3UECLnpS4W3inmR7Id3aUq+UUHouNA==
X-Gm-Gg: ASbGncvSg7SiGjoN4uNBmS9KYfsw6805Ke724pE+9oPOwjxRjInDnf467FVD8jDRBxC
 TcRwEqd33420gmff6YXwW09ity3v+Kmmc6aVnk2oJGS/u6bUOOSaMIm/lyS7m9oEYa63Tl4cvHO
 2fhlBGi+E=
X-Received: by 2002:a17:902:c40f:b0:22f:c568:e691 with SMTP id
 d9443c01a7336-231d43b5ed7mr3651705ad.21.1747329339289; 
 Thu, 15 May 2025 10:15:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyQ1lJRTrt0ixFwqDSorfu+vOM+xntr4u295e30D5QXpP221Ji0k3vGu3cCZvb1L1HAwi1LOMYcxCv1yN+h2Q=
X-Received: by 2002:a17:902:c40f:b0:22f:c568:e691 with SMTP id
 d9443c01a7336-231d43b5ed7mr3651465ad.21.1747329338912; Thu, 15 May 2025
 10:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-13-09ecbc0a05ce@oss.qualcomm.com>
 <lkkwnmnk32igcev3gykmtxsohyskj6ehylaypg2dyxbedvksee@lnuc4lfmzrkm>
 <9a05d545-1bf2-4f66-8838-b6969ba37baa@oss.qualcomm.com>
 <d7417290-a245-422c-ba00-3532661ea02d@oss.qualcomm.com>
 <466148c9-2461-4140-9ba9-5a3427ec6461@oss.qualcomm.com>
 <4ec678b4-9e69-4ba0-a59d-f2e0948a73ce@oss.qualcomm.com>
 <d0a036e7-605b-4475-8ddc-69482e16f0b3@oss.qualcomm.com>
In-Reply-To: <d0a036e7-605b-4475-8ddc-69482e16f0b3@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 May 2025 20:15:27 +0300
X-Gm-Features: AX0GCFt-coIgQ4I7VsKEP66vB_wjYiKvOLkHEJKM4dcQPFJlqXqrj14tgrxzUJg
Message-ID: <CAO9ioeWHMUf66Vb0XPw9eHRoAXzroSSqQRzW1o+e509-BK+Y7Q@mail.gmail.com>
Subject: Re: [PATCH RFT v2 13/15] soc: qcom: ubwc: Fix SM6125's ubwc_swizzle
 value
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: 0-h-I6aGAkN4jk1OJtdJ8fWowD0A7aAh
X-Proofpoint-ORIG-GUID: 0-h-I6aGAkN4jk1OJtdJ8fWowD0A7aAh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE3MCBTYWx0ZWRfX//BLqU8F+HZ7
 1b80UqRdEo9EUj9MfD2pf6Rfmu/KKpaujE3HyHTWILNOuuoXf+g0Ag8fOdRwX6wqicWo0kaL80v
 A0qpDRky3uckje/BW3QzTtmSf+k1z/y4CnQ000uH0rrGYCyQ3mf4fajbJkpIGGp9f6XQk0L8vmZ
 Jt7XSUIpqqgrjh2svBUhAxUzxDlYqOUD9oJxJBwgHqdfxUjMyPMdNXum5Nv+Mi841dNTZmh9/xf
 RzkurJUMGUiNoTjL1JSwrqi8AWOY/QelNnhNceV8gPgYgOsCFohqdJl9nAMBrfjlv5H/lQMYRwI
 CYcse+ItFISV9599FEOP6FR2gNs6riDs4GY8tZ4V+OeB30KWXRZIw0ilbdxA50MO1DaNa5eoaMo
 12l7daFu1uTnZht9fQ9hV3S+hcHzbpaFM5spm9894HD9kzp3oEs+jF2o0ima1qUexlSXz8Qi
X-Authority-Analysis: v=2.4 cv=Gp9C+l1C c=1 sm=1 tr=0 ts=6826213c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=2fJ-P6yaMz0-y6Gko3wA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150170
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

On Thu, 15 May 2025 at 19:36, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 5/15/25 6:21 PM, Dmitry Baryshkov wrote:
> > On 15/05/2025 19:18, Konrad Dybcio wrote:
> >> On 5/14/25 10:33 PM, Dmitry Baryshkov wrote:
> >>> On 14/05/2025 23:05, Konrad Dybcio wrote:
> >>>> On 5/14/25 9:23 PM, Dmitry Baryshkov wrote:
> >>>>> On Wed, May 14, 2025 at 05:10:33PM +0200, Konrad Dybcio wrote:
> >>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>>
> >>>>>> The value of 7 (a.k.a. GENMASK(2, 0), a.k.a. disabling levels 1-3 of
> >>>>>> swizzling) is what we want on this platform (and others with a UBWC
> >>>>>> 1.0 encoder).
> >>>>>>
> >>>>>> Fix it to make mesa happy (the hardware doesn't care about the 2 higher
> >>>>>> bits, as they weren't consumed on this platform).
> >>>>>>
> >>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>> ---
> >>>>>>    drivers/soc/qcom/ubwc_config.c | 2 +-
> >>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> >>>>>> index 9caecd071035ccb03f14464e9b7129ba34a7f862..96b94cf01218cce2dacdba22c7573ba6148fcdd1 100644
> >>>>>> --- a/drivers/soc/qcom/ubwc_config.c
> >>>>>> +++ b/drivers/soc/qcom/ubwc_config.c
> >>>>>> @@ -103,7 +103,7 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
> >>>>>>    static const struct qcom_ubwc_cfg_data sm6125_data = {
> >>>>>>        .ubwc_enc_version = UBWC_1_0,
> >>>>>>        .ubwc_dec_version = UBWC_3_0,
> >>>>>> -    .ubwc_swizzle = 1,
> >>>>>> +    .ubwc_swizzle = 7,
> >>>>>>        .highest_bank_bit = 14,
> >>>>>>    };
> >>>>>
> >>>>> Add a comment and squash into the patch 1.
> >>>>
> >>>> I don't think that's a good idea, plus this series should be merged
> >>>> together anyway
> >>>
> >>> Well... Granted Rob's comment, I really think the patches should be reordered a bit:
> >>>
> >>> - MDSS: offset HBB by 13 (patch 2)
> >>> - switch drm/msm/mdss and display to common DB (patches 1+3 squashed)
> >>> - get a handle (patch 4)
> >>> - resolve / simplify (patches 5-10, not squashed)
> >>> - fix sm6125 (patch 13)
> >>> - WARN_ON (swizzle != swizzle) or (HBB != HBB)
> >>> - switch to common R/O config, keeping WARN_ON for the calculated values (with the hope to drop them after testing)
> >>
> >> Does this bring any functional benefit? This series is unfun to remix
> >
> > I know the pain.
> >
> > The functional benefit is to have the WARN_ON and side-by-side comparison of common_ubwc_config vs computed ubwc_config for HBB and swizzle.
>
> HBB I agree, since we'll be outsourcing it to yet another driver, swizzle
> should be good enough (tm) - I scanned through the values in the driver
> and couldn't find anything wrong just by eye

Well. What is the ubwc_swizzle value used for SDM845? I think it
should be 6 according to a6xx_gpu.c and 0 according to msm_mdss.c.
Yes, higher bits are most likely ignored. Still, we'd better have one
correct value.

>
> I realize this sounds funny, but all in all I don't think it's worth the
> effort just for that one
>
> Konrad



-- 
With best wishes
Dmitry
