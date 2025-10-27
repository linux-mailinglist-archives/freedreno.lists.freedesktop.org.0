Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D956C0DFC1
	for <lists+freedreno@lfdr.de>; Mon, 27 Oct 2025 14:21:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD4F810E498;
	Mon, 27 Oct 2025 13:21:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nV6DbO+3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76B110E498
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 13:21:41 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59RCfpui2781102
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 13:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=rIQxrF/LR8wD4VYuDzgo4pyg
 T4/SDSgx44EBgWbrJxA=; b=nV6DbO+3V3TP7iJifABgm+p0yKf+ze7sCSnR8z4W
 +BN6EBSgDdRRkclO2PDXuygXbH34Dx4lSu/beNQirSR6yoZEvRyAsqYcaqq0PiYJ
 6KRhqhsLBQZ8h+GRrkVCFqaAWkbBc7CMiV4dPrW5U490eESJjA0/qwb2TsMGivG6
 oQxqneDieGlsqKFKokuWXfaAEaRNV1glaMSgYMV6SQJp1r+N+IBZ+VSZKXReNZNp
 rW//c0Hs7YSQz7bClrlydJx8F9Yhglv5+zMQrdHE+QZZ2uyZorQGBQs5a6zT15Lx
 MhfdyTCU3WC4zdn7UWwMjnm6RLEbYFJgwfpSWmFEgWog6A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a28yar3hy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 13:21:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4eb7853480dso150012611cf.0
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 06:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761571300; x=1762176100;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rIQxrF/LR8wD4VYuDzgo4pygT4/SDSgx44EBgWbrJxA=;
 b=pUTc5RP9S/vIX0pr2FRA/p7HQpYjvB5HstRQQOM2tH5dVrXEDG0wVWTY2ZodsdYeQh
 n7nAOIjHl+UzaStN7TV9KdH/isTSNl8TCYiGOcCVzNnf8GjKhZhF1fMf0YI14i5Lhh2v
 5ZL8fx8o/dxK/CpWT3+yEbBWE161JzOCgca9S/lr0YXGy7z7BuZCpWTTKv5myfv1dKax
 fNMrxatKZAW/f5EBvA+cuDpX5e7JvycTexnRtTeVOC/IVwGnpHyDQc71wumPGOr6thnm
 89A/YZXO6JFHHUc195/Sn4zzovVqXxyNiCE8p1taRuEbgsMzX6t+N1o5Zi2MI8S4SKeQ
 ITqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXH49uG9/Ek9uSvuMJMydmgojdK2vk/Nsa5GF6Rt8kGT96XF5Fh9KRd0SiN8Wori4Tj/kg4PGs0KoY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx18QzLcy6oXBb6v0Od1No2Q1cUhfq3gt4Gx0Dq43+krgErsxjL
 2eqjhQId7DKKaFq/Tzux/CmAfd2q4CBHkIIjCS0ijB9snDWYsXXfAQ49cUYgsb5rU3m8VSUFcpm
 O3mbWUpcFvTaarVQhLoomtJ5hlrwVV3UZ0eMUPTNq4m7ZKh5z+oGsO7r1ZC/3FpDq0sMxnYE=
X-Gm-Gg: ASbGncu35r8N9iqPvZXVxI+46Guo/yvODzQu1ATFmkvaGAduDbx+J5HWBGwScG7fAya
 PsV79Tlfh8RlyaWIzYaluxfFXnwcGSv1JdBL8GHAxEJyFR7zxDJHvSD0WFSW3oVidHXtGU8bdPW
 aKYkwZ6J8+ocZikcfy+YkmGvOui2AqRmgZlEQDqEY3uXbhVQBTXHT/s+Xb0mLWY34/5okQiEU+d
 A95kcyzEPJdYIhxsRoW5yNV4NIPqanzvaMSeDt5X/hY7ESmX64DKsrSpSXwYHy2fiER32wM9o9n
 4BCl6tnW1OaslfVvjFwXZ6TSe9YoShCwGSXjn09ATuIjh9+SviqxQNmqZ8MOLNBmWbh0qWF7fcG
 PzL+EhAeCBnihuw75fK+nZzceaesnObvumtzi+/Rqu0+sGL9oEI1m1P8oadmp+3w9FA/Qvqj9Cb
 VEX5ZeSZ+OagW0
X-Received: by 2002:a05:622a:4c12:b0:4ec:f035:d60 with SMTP id
 d75a77b69052e-4ecf0351008mr67145981cf.5.1761571298235; 
 Mon, 27 Oct 2025 06:21:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHsY3iHzVCLpUn7wkz6y9duilAb8cRKkxlio5523RK3buC8sPqKlAaBcxT2E6xXHVj0E4Anw==
X-Received: by 2002:a05:622a:4c12:b0:4ec:f035:d60 with SMTP id
 d75a77b69052e-4ecf0351008mr67143811cf.5.1761571296230; 
 Mon, 27 Oct 2025 06:21:36 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f41bf3sm2291171e87.20.2025.10.27.06.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 06:21:35 -0700 (PDT)
Date: Mon, 27 Oct 2025 15:21:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
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
Subject: Re: [PATCH 03/12] drm/msm/dpu: Compatible with Kaanapali interrupt
 register
Message-ID: <st53uwtdow2rl6bvmfitro2dmodxtzfnhyzon4xeeetkkwekxh@ewlzkelq25wm>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-4-yuanjie.yang@oss.qualcomm.com>
 <nfekr4vi34ftxzyyf5xv4tsb5cr3tokiyfkerypqjf26dos3uq@42wcn6ji7nnb>
 <aPrre+WXogSZIE7L@yuanjiey.ap.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPrre+WXogSZIE7L@yuanjiey.ap.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OPsqHCaB c=1 sm=1 tr=0 ts=68ff71e5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=uwcRXY6SZ9cHZavlex4A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: zhFacL7jglyWiMbUhC0yctznPnQM-_u-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEyNSBTYWx0ZWRfX9/lo2SBJBAbo
 XH6DXgx+mHXx5M83+jxni0QQfB55wa8iieiotc8AAXRnNeCofebSTQjQi/cC0HkeuhzKPmtkawK
 ylqdQP8L7LeJb8nKM12+cL90J3LzNBIcG9G5+FAtPaF1mYbnK/t+eWJtFSjVhTPiyJhnDDocNlQ
 NOEtHRS53Uq0HCi3Q3ubJL+p7nk4xfmi+JqnCqamlzd7/tuUWsu0MTdzjLQbgO5/8arTgkKRpXe
 qlbZt0Ti8Dw1UvRwrD65irbJZoxtHiRfg7jxiFfptByZvM+wCAFcoTSUd7pSk+dIR0+uo9/bew3
 K19w+/zLMfQN4Hiv/YhS+MjrMLUXk42eNkZ0phekhD4eIlgGx/jEpW2GKnx9MmPiyJgyxXh23Wr
 xe636tnpnxtkDs9YTOXGIE+1lA1KvA==
X-Proofpoint-ORIG-GUID: zhFacL7jglyWiMbUhC0yctznPnQM-_u-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270125
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

On Fri, Oct 24, 2025 at 10:59:07AM +0800, yuanjiey wrote:
> On Thu, Oct 23, 2025 at 02:59:12PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Oct 23, 2025 at 03:53:52PM +0800, yuanjie yang wrote:
> > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > 
> > > DPU version 13 introduces changes to the interrupt register
> > > layout. Update the driver to support these modifications for
> > > proper interrupt handling.
> > 
> > So... Previous patch enabled support for the platform and it has been
> > using wrong registers for interrupts? I think that's broken.
> 
> I want to express DPU 13 has different INTF register address, so need to add new
> interrupt array to let DPU 13 interrupt work fine. Maybe I should optimize my commit msg.

Make sure that patches are structured logically. You can not enable
support for the hardware if the interrupts are not (yet) handled.


-- 
With best wishes
Dmitry
