Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B98B7B2644B
	for <lists+freedreno@lfdr.de>; Thu, 14 Aug 2025 13:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A8010E0C1;
	Thu, 14 Aug 2025 11:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WSR/pTAR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 667DA10E0C1
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 11:32:03 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E94scg002765
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 11:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5Kue0XqCDQBiFPjMdNWdWUal
 mMTuGI6iAR9wq8/BtWc=; b=WSR/pTAR391nn50XjCL/aJZ/WTlDgAsSGBmK5J1y
 Cy/Vr3PgP9QWmRpKzk6VMpymN5nB/eQgmbs7ynWfyOQ85zcbALsODg1rba7u9vDv
 +Bb/joRtfdVmt2TsB8zng1kpYG4begVuwzZkCzjgn3WIoP1wilsTYMgi63qn3zlj
 nRa7Br6Mu+sstVVm56IT+NVsI5zmB7A9qYHEU6m8wsNwxVIT6y+yCTDWujnZa6Nq
 N2ruh9V0w/wBoYD/puEmhsg1Euq94f3JWhi8+1qn6OR4BOD6awYAhIUh8nh/KPw2
 7HF2Q/AGIRZy8K76xq1Wa/3FGnv3+eTUEq8FeYNZ6F8J2w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv7gfm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 11:32:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70a9f562644so18972276d6.2
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 04:32:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755171122; x=1755775922;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Kue0XqCDQBiFPjMdNWdWUalmMTuGI6iAR9wq8/BtWc=;
 b=hDFivXu7YfLbWNdM9f4k4QYwD4YlDotUDWVki73TyBhWR8cIrDESIQdiuWcqNC6lae
 BwtYehNcv7Qa+NLFoWMy/iRWfOpF7CpKcZgmnMhFCbdeJYc2Y2GsPH0TKv7oldkypKW/
 Bsuo/iJr0i1hmTpUm5tWDDFzmIJwpLNZ46wc8teW6/nMAkM2HPbU/1yQwqhNyz5qhgdf
 T3yG2EkTId4ABjyZ4VqLlMrMV+9NoLwoONINMb6av1WNtVqa4bsTfQGgnNZFYXCMGJvX
 /3fzJmo/lqV9I5oHAE8UHlyIvcr7gsCLQzBUojjhQwRztiV3sJt4zxq3ZZnaxcCGWa30
 SLdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwhzRK7JRLiK5lyPMLDPY0w4V0yAOgonD7e8qIY+KaTP/ymUr/GkIg3fYME9ydInBRK4V6nGbYf/w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIbP7c93Qkt90kYXQBqNg8lc/faPQZm4qOV1nDm5I2OKP3vAYQ
 fGDidQs2f7wQhZySjiQ0VjdZCqpF7KXfrSOOpXyQ3OFhfDOTnd18G9sNMpXQEiYGJm1W31h0WOL
 3tsjxlvE2hIE/UchEWRTnQz5rihEJFQuK+dhLdSydax8fQa2e7a/ohNhC6jHC5Tsax3I6TAY=
X-Gm-Gg: ASbGnctgpnUlUhF6JnIu13n4JRE7RxucOauac8b9ggdyxlpT0kK5Zyirn8kLpEOp+MS
 UhHbZIzX+VVWmTx4/zl8i54yETwdd4V2hDHx1EMYYRHWLcsprhBx5mUHFngJP/F0KVzXU/7b2E6
 4GHSwRmQzp4PK1A/63IOglsHipmHNrFLqNdSCd9YtCiYaJthhgolyiwu9V60zhp4luIKE2up8NL
 1GMP8ck3py6V8GDYcpWqnZc4m6W1Tm7kd5wnbIuGeFDY7ElPIyRHB1JQGz0Ia+spwKzcvZ8t1H8
 foAiPLHiNxwrF+M4uAU8bNeSnvgWkVNLNAkfEJGL+34x+uJUikxXM6KGRw+CZgP3jqeSB0Cwr/j
 zpeIcZLi3JIB5o7m1wWgnaOExIesjL53h59JkvsoNantrPTE1FdNl
X-Received: by 2002:a05:6214:5006:b0:707:159e:d1c9 with SMTP id
 6a1803df08f44-70af5ca363cmr40078146d6.51.1755171121609; 
 Thu, 14 Aug 2025 04:32:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg5jdW8W1fj9bgKm6O8r1ZKr3wStaA+qanKjmVzi7C0TiTgUxx6swb/Qxlonq4zBcA2g4FEA==
X-Received: by 2002:a05:6214:5006:b0:707:159e:d1c9 with SMTP id
 6a1803df08f44-70af5ca363cmr40077536d6.51.1755171121034; 
 Thu, 14 Aug 2025 04:32:01 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-33401455074sm530531fa.46.2025.08.14.04.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 04:31:58 -0700 (PDT)
Date: Thu, 14 Aug 2025 14:31:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] soc: qcom: use no-UBWC config for MSM8956/76
Message-ID: <3muxbxytdezrptwrugu7yz4byycq6lteezrv22gs6abofhdst2@nnawschabj4q>
References: <20250814-more-ubwc-v1-0-d520f298220d@oss.qualcomm.com>
 <20250814-more-ubwc-v1-4-d520f298220d@oss.qualcomm.com>
 <7813c237-241b-4f09-8948-283def984792@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7813c237-241b-4f09-8948-283def984792@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689dc932 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=velJiXW0qwFq1mr4VzAA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: aDPoCZ0MdV0KwfA9X_pmmcp2UrdSrmc7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX2q+/Sv6nB5YB
 igc64VYX+AsnzlPZL/hnoXd9YNA2hj3aKqo1slfciYaRLEf/TC0ghuzynZoO2XjeGLrY3yTGote
 IkacArWXQYtkYCdsQ0yLlJWat3hI9sxL0H4B7DcUv+mA/VvMVEXusYY4waGrWiRdEsFBdFiALtS
 RKLpAsiSCQsupvOWscWF5n7STnPjb7c//V4xw5i7TpWwV2CfbmNekGYiufBO02Oc5zEqKTpVcZT
 D1dWP+WgKPXzcfOOu0Rp/a7r1kot81tyFcWwz/DUlrcGGPgI56qyjK23FUqxRzvdZXPln8Cw0vi
 Ziztb8pr9Ie6tx8RkX9wZbb0DuXckJJ+uUsVWK74Q024Qowp64IlpwfIR9IFY1PEW5rc93AMWtG
 /dbQntH5
X-Proofpoint-GUID: aDPoCZ0MdV0KwfA9X_pmmcp2UrdSrmc7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025
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

On Thu, Aug 14, 2025 at 11:25:16AM +0200, Konrad Dybcio wrote:
> On 8/14/25 9:22 AM, Dmitry Baryshkov wrote:
> > Both MSM8956 and MSM8976 have MDSS 1.11 which doesn't support UBWC
> > (although they also have Adreno 510, which might support UBWC). Disable
> > UBWC support for those platforms.
> > 
> > Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

I've posted this patch, but I'm a bit reluctant to merge it. These
targets should be able to use UBWC for GPU work, but then rewert to
linear for scanout buffers.

-- 
With best wishes
Dmitry
