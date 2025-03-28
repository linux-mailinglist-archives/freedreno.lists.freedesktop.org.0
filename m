Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 732C3A75101
	for <lists+freedreno@lfdr.de>; Fri, 28 Mar 2025 20:45:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374CB10E160;
	Fri, 28 Mar 2025 19:45:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZlO/OiMs";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D675C10EABB
 for <freedreno@lists.freedesktop.org>; Fri, 28 Mar 2025 19:45:29 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52SJ813O022621
 for <freedreno@lists.freedesktop.org>; Fri, 28 Mar 2025 19:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Hvro5GjO+Wldw2eoT96XJ63A
 JVuzQWMJ2SYOkl9vzGo=; b=ZlO/OiMsXxnfibTyZMAPDrBEtjwu2ltf8lQmaeA5
 W248m61J2AHxcnDgiZy0T4s3fEFUMzZGeEDPye3Q1jT2y9Dz/smTI4Jp1SNhj+aJ
 w0caTVUJroQ2M1PPu1dZnA2O8tu9mqGspOUzPdEYZTvExU87TT86gSSr8KfDABDZ
 C+Hp8+IQuY1eLoado+IKzp/9bg8pMr7vey8pV64ubw5kYcDqt/EwjzdBg5QrAsyx
 CtkEymqeCzmwEVZzUHt7zG0INLoEgrG+kGJ6VFNk3OAMqNg9AIl6J86R6Mu+jcQ3
 iRKxsCWRTf41D6LacYwwkKx7L60n4ogpWZwgfKmu6EXLhA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kyr9u7vh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 28 Mar 2025 19:45:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2262051205aso35963925ad.3
 for <freedreno@lists.freedesktop.org>; Fri, 28 Mar 2025 12:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743191125; x=1743795925;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hvro5GjO+Wldw2eoT96XJ63AJVuzQWMJ2SYOkl9vzGo=;
 b=s0+kk25w13lljRu5DygS5WCX27ESgJgazHzLP2AMGxyNvy5wz5YGIaYuufIChES2pr
 uMSWNh0Y82g8dI/HODRKfD806cYoWEdc680tJfUJgg3l7g5SvNRymBdFU+9DYJ89Eayp
 ndrgoVnHMIA1LcSuqcNjbDNI/DkocewGWdAipuzBTvHC1rZHqHw3tbKYdab9vpUEdLaY
 o9tD6NdUDC+lCvPzHbFzYHQlEZESl3g0Nlz4V0re+7/GKsK+/hVhvVsDGAz3CGAlLQQk
 v39ggiG20MXGnAKqZOjmjFkagx0a44WrT35MfF7f7yhgrzgFNNbHjFJrfhhjfppxdSMI
 FgiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUAFZowIPOOY0LHToSkfMPQuJRwKHTRwMifCzS3KUC4dbenBB0Ix4/w4K5k+978XbSBaJ+bsAoMLM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUjRoe/fC/He9woRJ/+VqZPMM/BLx1ZsN46HCFHRb3LEZzvVmx
 7MFjJuPq67621pnpO+B7/QsO8tgfTs07JctSX92/Cz9Ph8c7n84RPPuoInKeP7VJKgVnsLIkWOC
 20mU2d6MhBwPug3BjuIQrNvO/76TyMmnvXRBhHVsGLX1Vc/0GexendTNs3gJ7P74ni8Jkescb1C
 FyfCrqt+4aCLD5QtB+6fkHGtcHZT+3OG5Fe0IY6yhESA==
X-Gm-Gg: ASbGncuj2QnsSLxIkzBBxcEoqiFi4Ycp5kBvkuDerzFGoRS10A4D+MzKNtpP5yYjzUX
 rN+jmkBwDeZsLO1K/7ghh35m+oaX6Hyy0yrSLnuReUY8jKyEQ9XnLQCB/4kitZuAItvUh8PY5vF
 BUQo0dVf7sMyNmbGIzO0NJWlugoIdW
X-Received: by 2002:a17:902:ea02:b0:220:ea90:191e with SMTP id
 d9443c01a7336-2292f944dd7mr5603155ad.4.1743191124711; 
 Fri, 28 Mar 2025 12:45:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2FloYykYPJgUHYSECpQ9Y3zz3A/KY/pa3AFDLAj9DQXvG9v4c/yWr4SAhhsaubUsKlu76YHyagAGjGMbmqyc=
X-Received: by 2002:a17:902:ea02:b0:220:ea90:191e with SMTP id
 d9443c01a7336-2292f944dd7mr5602735ad.4.1743191124237; Fri, 28 Mar 2025
 12:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-8-quic_amakhija@quicinc.com>
 <20250312-athletic-cockle-of-happiness-e88a3a@krzk-bin>
 <d64bf3b3-7c4d-490e-8bd7-1ad889aa7472@quicinc.com>
 <0220605f-3ff6-4ea3-88e3-09e602962a61@quicinc.com>
 <zzcd4pv7laryb2c5wkuwrhj2ih3lciqgxfyefj4qmi5clxftbi@ykpy42anl4jm>
 <d09fe2f8-fdfa-474c-a742-b6cd2f8662e1@kernel.org>
In-Reply-To: <d09fe2f8-fdfa-474c-a742-b6cd2f8662e1@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 28 Mar 2025 21:45:12 +0200
X-Gm-Features: AQ5f1JrEmDVBvWjH9IO2Mtkm1mRjebe3Iamg0GwU0FiHaNIm70ztqd-cjwD8G_8
Message-ID: <CAO9ioeXSdpNq+cOSHhbbE2Qya5LXjXixj4_g0h2PHBRcLxdsfQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: ebnitj5GIni-7YbvaT9SiGdHR8jBi1in
X-Authority-Analysis: v=2.4 cv=UblRSLSN c=1 sm=1 tr=0 ts=67e6fc56 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10
 a=VwQbUJbxAAAA:8 a=AD09SHeqe-8lbBjqVQoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: ebnitj5GIni-7YbvaT9SiGdHR8jBi1in
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_09,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 mlxscore=0 impostorscore=0
 adultscore=0 clxscore=1015 mlxlogscore=698 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280134
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

On Fri, 28 Mar 2025 at 16:22, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 28/03/2025 13:45, Dmitry Baryshkov wrote:
> > On Fri, Mar 28, 2025 at 03:13:57PM +0530, Ayushi Makhija wrote:
> >>> These both above commented from Dmitry I have addressed in the version 2 of patch 7 of the series.
> >>> I have squash patch 8 into patch 7 of version 1 into patch 7 of version 2 of the series.
> >>>
> >>>
> >>> Thanks,
> >>> Ayushi
> >>
> >> Hi Krzysztof,
> >>
> >> I hope this message finds you well. I wanted to follow up on the reply I sent. Your feedback is invaluable to us, and we would greatly appreciate any further insights or comments you might have.
> >>
> >
> > Granted the lack of response, please make sure that you've addressed all
> > the comments and proceed with the next iteration of the patchset.
>
> Just to clarify, I did not plan to respond here, because email style
> which tries to respond to my comments is unreadable. It's impossible to
> find what is quote, what is the comment and what is the response.
>
> I expected inline responses to the original emails and detailed changelog.

Works for me. I'd say, let's get the next revision and check if it
resolves your comments or we have more comments.

-- 
With best wishes
Dmitry
