Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B319ABC1AC
	for <lists+freedreno@lfdr.de>; Mon, 19 May 2025 17:08:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62CA910E407;
	Mon, 19 May 2025 15:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="n4J51pG8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E5F110E2FD
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 15:08:17 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9I1Bj016028
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 15:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=pnbK04rSw5LfgSejzbkh3QJ3
 tYtMCLEGOFKCm7S1tuY=; b=n4J51pG8BVZa1SayKI0SpSjmp257mTlLVz2mPke/
 GP4Ws9bG81sl4rgTq/gVV2Qabr1qPr27513kQ4Qr9364x0oL4oSEBbHeJXg3XCds
 8fOo03NrIYOPGR95kIvQzlE/buW2JkN4Y5c7UgiIdGAUXPRs+BvKJyyLbTtPhn+b
 uJOuOg1fBh6vihIbR1syPZDRUJ81nMZzHWucLdijEGSwNfGO6bQCEzXPcmptBYLj
 KvtjpHs4ft9EMQpYmevTyn/E3DC6gIuZgeFCVweO0/bMSvJssF6chY8LOklWV9Xo
 Mct3swrsEpuvpY25JZHecb13xCTn+x+cVimMyLMFVtrkXw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnymsw7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 15:08:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7caee988153so858939885a.1
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 08:08:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747667294; x=1748272094;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pnbK04rSw5LfgSejzbkh3QJ3tYtMCLEGOFKCm7S1tuY=;
 b=So7KotZdRxRwUWEKFJeU52cuC5gUAmbuQyEsXEX+3k43rM2rTtKic6MGlo9n9KDi80
 XB/S2jh11Z1emPORhSn/L4CdMdByq4u8XSPvgIUN/Is3ikEde/mouzW5/VrPWOrX4SDi
 KBvnAGGfCjxyG6H1DAM5g5U0GaYFC8ftV1Z2498ZS4NyJyxiViNxiHquhS4GamgDwPfa
 s5x22nEVzJMwFT8n20rq0E6IVP/1Nn/3P00+YJv6mGR95FiV1m+F943Jo8DjRveSQG8f
 wiYd1uAvNiKhYLrVqC+CrksrMbHBNMwKAeTnIipMbIlegcgVH3PGsYmziCpyMGdApWIL
 IsEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwI3kPBsdBeXgpRMUwRYOWrWusJA7hS2Q1ZqYfptd7YkfP8FR1rCD1pW2+OU5F+4wE6wkRXeAYzZs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUE+yEXpwGwgb2OT7/GtLAeJ2AXJzaVYvJEKfE44+0eZnBwPwp
 fb6Y7Fx282tpD4gWXdNt7OaMIQVP5KGePGesuABV+QbpU8/leYjrzUY77aLj1eye4JTFCyxwFwu
 FcH8+HS863yFDus1JaulyNXaGbfaD7ase+/qChgW5kWWfu67u2Rlz/NngeaP3QXGJ7Bp3UXGvWS
 pN3wQ=
X-Gm-Gg: ASbGncuXbxVE1X2v4LHCEjKT87vSs0WsavuBje9UBwc3LuW5ZW0r32e2kJUqwZBWGof
 UVD8iXOWZuUV7FbOPqMz910GGRPGjRoduzZUEDEQeC/3sq554Kgb5vID4rZABPHYKfQaDygFgnc
 ufFuwnuZ57GAFWylSk8L4D5wRRy33G4WH2w5MuM9SqoIRtiPWtRDwAukKR5yXIp6Bac9OYZ6Ns5
 OCquumsp5KItXIbBDstZo3JDwk723kctkTnfvyDv8z4qQUawEGY3fo8FBcyBiVZPP1wMu72bHFA
 gqzOno5zqU82YWbPz6fmE9n9VuI6TisXdYHJFLQOLhX+sEE4WDLVv6c26fy3CDXMPkDMtcEDXw4
 =
X-Received: by 2002:a05:620a:3192:b0:7c5:562d:cd02 with SMTP id
 af79cd13be357-7cd4677d561mr2028142885a.41.1747667293787; 
 Mon, 19 May 2025 08:08:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS7ZI9iTUTS3skWTcOcofhzUOZ7bKXIr+bJqh1BroaJVamHikSdw6gyrDyo62FkE6ExDiHnw==
X-Received: by 2002:a05:6830:488e:b0:72a:48d4:290b with SMTP id
 46e09a7af769-734f6b88831mr9233068a34.26.1747667282670; 
 Mon, 19 May 2025 08:08:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085f097bsm19317971fa.110.2025.05.19.08.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 08:08:00 -0700 (PDT)
Date: Mon, 19 May 2025 18:07:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v5 00/24] drm/msm: Add support for SM8750
Message-ID: <pbg537yuu3sy2ueho5gcfu6cuvgmkobzgvtfemghvp5w6errtv@f4gbobbeqosk>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <75f503ea-e8cf-48f3-b39e-388ac456821f@quicinc.com>
 <24e49307-7d75-4736-9b5c-2e6286fe57a3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24e49307-7d75-4736-9b5c-2e6286fe57a3@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE0MCBTYWx0ZWRfX/hErY0EaleN5
 b7xcQggcDmT3egjJwbP2Ajxhe7ZrAUdbDn1lxn21S6zvFOYhADhYzkYhrY1IDTwMdruxu36bdPS
 dTZRwrcWV61iCtjGUaxIfY7CiJxQmXc1bpI8J1ebfxiIWmsbmOoARYdYzUft3ATN7p/Gtv+iFeE
 HIghxdZGQMx5W7LLuRo0xdKThl6ERmQQg3GTbIP2GjM1CHpzuXEtNbXNTp/FXjkvyGcC4VrO7tm
 9FAwWpNwWCtx0IzLgUNvNOcFCvjbLxCg/kzv1o71suUqzoQoQ9PJvHNXWjO7T0TWsgInqafqrQQ
 7GqR3idXiWO4gkOAaVc4evAMbiDv/bothlWpkEyZ9KMa2Kt/Koxgq1QfplInIaC/NkE3J5NiqY7
 a+b5hB4v0Ec7kVGA6OUinmXJYK2auCWpkUFRN6d89d6n5ojOfz98/+QcQLMINukC7It8GTRS
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=682b4960 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=mreiCzLEixqGZhZwl8gA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 8_wdNAsWi9OvyKIK8tCFCCBYf03DZ1Ap
X-Proofpoint-ORIG-GUID: 8_wdNAsWi9OvyKIK8tCFCCBYf03DZ1Ap
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190140
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

On Mon, May 19, 2025 at 04:52:15PM +0200, Krzysztof Kozlowski wrote:
> On 17/05/2025 02:08, Jessica Zhang wrote:
> > 
> > 
> > On 4/30/2025 6:00 AM, Krzysztof Kozlowski wrote:
> >> Hi,
> >>
> >> Dependency / Rabased on top of
> >> ==============================
> >> https://lore.kernel.org/all/20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org/
> > 
> > Hey Krzysztof,
> > 
> > JFYI, I think there was some discussion on IRC (specifically #linux-msm) 
> > about having the feature bit dependency back in February.
> > 
> > I believe both Abhinav and Dmitry agreed that you can keep the changes 
> > to do version checks and drop this dependency.
> > 
> > There are still some ongoing discussions regarding the feature bit 
> > series, so this way your series isn't blocked by that.
> 
> I was asked by Dmitry to rebase this on his rework. That was quite an
> effort. Now I hear the dependency - Dmitry's rework - won't come in and
> I need to rebase back, which will be more effort. Can you all ack this
> so I won't be needing third rebase?

Please wait with the rebase. I still plan to get it in, it is an ongoing
topic. Anyway, I think there are several open issues even with the
current version.

-- 
With best wishes
Dmitry
