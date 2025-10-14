Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6BCBDB997
	for <lists+freedreno@lfdr.de>; Wed, 15 Oct 2025 00:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D59B10E6A9;
	Tue, 14 Oct 2025 22:17:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="B9XLbw6F";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB8210E6A7
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 22:17:06 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EKRFv2013798
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 22:17:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=acxFHNB1qCMmBdmM94I3DPDY
 6fafFAZsfZx2OVrKtSs=; b=B9XLbw6Fx2zZ1zBQM570nvp2RMkPYfqyQDQkWZhv
 fzQTbA08rlojgXNeCKfhGuQOndGo3Y9tjj47AwmdGiNu8D62lfTRJqwRTWqzObbm
 xX6SwScK2mMiHynka1CbmHUJMHuVb5DV1hyIOwY0wpOeQ2enGaDuK/DwgLiZ8FrH
 VoyoZlgmM86qvCb+OekhKp3cfCmCoNexlt8FcneC3FxejfLl1BhtIjXifYcyBjaC
 GxUgqbLfCGJ0pdouIlqEZdznFyJgvzWwVOXiKK9ZPB2zaNkC7Ug2trpVYDm865Qt
 gxicwWVxfk9/n1UxpeD35z1/p3BZ2BpyDKkH01UxhTINyg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdka62c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 22:17:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-88e2bd0791cso8746185a.2
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 15:17:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760480224; x=1761085024;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=acxFHNB1qCMmBdmM94I3DPDY6fafFAZsfZx2OVrKtSs=;
 b=OhR9mzcr/XzbMst6la/PS4azhSp9jmegKrwJf1nPWBFvbnAjU3pWzVU2XERtyFgiSM
 L2izwwxVlbl64sTJ/Hqh0JMWxwFkOS4ZmbRtW7WPQi1zd1CUD6jw6q+HVE345lx1auMh
 qaL4JccqI5xDrYeBvp2Cp06Qpaw7qUAUQUX7X5+Dpf4loApANZAc6/up/fnzJjrMXB2n
 ay9vmaui9gTWAH9vovqaWi4oH2U4c31JxkmwrqUPoqZoXBG5FzPU+PcZ2PniPTGFM2Z/
 YHCOufqTAnr2V/K3eTCv9Ef0V9TtuYVmFYw2fEaY07b+l0htAJer5GpQacAsGwdBafi5
 5DXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC2soKgLWVRL9BjuQ0k9VZuy2u98fQqqMwuidBu4Q7bvRrUJqAohlAkewRyad/Kb+bCWqCk+79nVM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxz8FKHATNnHH0z7xvCgjdHAKA8CH/9Etg7H2jYmt60kVLU9F2P
 8NsF+U+DuTXQKPMRcsScgckgm3LdAKG/YPvP5SPTsxlYwQ2l3MytbkheXzmKPppUNAD+bqJtmyt
 vtSD8Ug7AEuqgVNDGaQEEBfZPOAM4Lc/Pwf581Gx+QgndfMkZEX9oZgm5RUCCIBYimHzsBXk=
X-Gm-Gg: ASbGnctM6JXVwHI95SUAc8Q8AQOxUI9w73iiwglhMaHBnoYGzYueknrNhST30FtnYB3
 7xDVOejMjXbz3c6N4qia12eU7tLMrHM1MwsbrH9hcXjIWGPA5xP376QyzdTTOZYAdBqjDcI3TqN
 1EsRu+x654Ev1D0r3t62/Zopepdujw7tLYqPTT7yngaUtrrs7xFcozR2brEriA/iYFAvlHPQR8I
 0pDwLmNlQUIxIzVzqf4Mymb7NflZTbBcYWlzV0O8cVd8wa9gN213b5SeNl41m1qdpeAxgxdfMEF
 3j9h/QRC5Z1YxkhBKKE8qWKtpLDX0LK/YZWDYekgjvbnuc6zA5dzL456ITi0rNKyM+ieil59tzi
 Vm9A+d7KtyZ03Pa1arb2kuu/MPbQICsFGgFjgh1oThwDjqyc9bA79
X-Received: by 2002:a05:620a:d96:b0:84e:2544:6be7 with SMTP id
 af79cd13be357-88356bece86mr3605348385a.65.1760480224040; 
 Tue, 14 Oct 2025 15:17:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqry7gL0o/foP5bdIZkkIufw42pdC4mWKYSgvEtxW5lk93OwMTW4qm5JmsLq1hgKg1FOcqoQ==
X-Received: by 2002:a05:620a:d96:b0:84e:2544:6be7 with SMTP id
 af79cd13be357-88356bece86mr3605341585a.65.1760480223473; 
 Tue, 14 Oct 2025 15:17:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3762e77ea14sm42497401fa.7.2025.10.14.15.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 15:17:01 -0700 (PDT)
Date: Wed, 15 Oct 2025 01:16:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: xiangxu.yin@oss.qualcomm.com
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: qcs615-ride: Enable DisplayPort
Message-ID: <geh3pbatv53bnk2zgyalnwvumvcsqaz6n7x6dniohsfk7r56sq@mpflfuye62ly>
References: <20251014-add-displayport-support-to-qcs615-devicetree-v3-0-74ec96ba8144@oss.qualcomm.com>
 <20251014-add-displayport-support-to-qcs615-devicetree-v3-3-74ec96ba8144@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-add-displayport-support-to-qcs615-devicetree-v3-3-74ec96ba8144@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: C4ghF4xi85mUEQcXFi26Wf3YfmLVOsUo
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68eecbe1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=VdtQghO5X5uSFlG9jygA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: C4ghF4xi85mUEQcXFi26Wf3YfmLVOsUo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX9NVEWeVBZD6m
 Ob4ot8A3+PTSyRZhx+Unkv64wCRKd+XUR+YkrVYJICQRt57b6Aq5XrenGzTauySXCRrNaBY7KJr
 aEeY+JicRoMSBWxGRo92enuwsmroz5HV6uVq+sXHZH5BEkxdgWDKCMCHAi40s5sIxQFdmUBz1PN
 q4Aaqe75PRZHZJk9fC5yV0SIm60TCcLcptaRxPP2Ijsw8q1Inwsf6v/XfBHPjedsldTlQ3cJHRB
 ibMxq48uWKC2ty+gZRXup1zyoAQS0p345ko2hYzENPS3NDnSQ+OA4QjQxh/4Xhb5gPQhvoFss3P
 1JtplFnyJjf8i1nlKljSeS02mYbT8GqQ6Lc/8/4XwwTt7wLcaimivQP0ermz5iQ5yY7vOWC+ktw
 uXuS+0AhmSXapEYP3HEFHq8eAXvrcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
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

On Tue, Oct 14, 2025 at 07:54:56PM +0800, Xiangxu Yin via B4 Relay wrote:
> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> 
> Add DP connector node and configure MDSS DisplayPort controller for
> QCS615 Ride platform. Include lane mapping and PHY supply settings

The "lane mapping" no longer applies. LGTM otherwise.

> to support DP output.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 

-- 
With best wishes
Dmitry
