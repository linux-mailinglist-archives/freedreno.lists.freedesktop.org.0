Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4119CEA70A
	for <lists+freedreno@lfdr.de>; Tue, 30 Dec 2025 19:11:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95FC710E935;
	Tue, 30 Dec 2025 18:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JcUq3ATE";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LoYS38jU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA2D110E93A
 for <freedreno@lists.freedesktop.org>; Tue, 30 Dec 2025 18:11:42 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BUFaPob899679
 for <freedreno@lists.freedesktop.org>; Tue, 30 Dec 2025 18:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=HPNCoFW0b1ET+3JulFr+b4L0
 SqkCQC1DxA4qIwg6NPc=; b=JcUq3ATEUmLzbxJpIZjjgwKJrX2YQkrbILoNvTKJ
 PqFopB2qaDTGSp3+zgEqlrlZE/oos1WDqrWj7a0wE+miIj/T1IETgS+DxqFL7Wmw
 XG//pFvAJ+pgqNEruX1NHNFFJjrGI7bszquBxmkuVAqP9nSqVZZmn1nvFWoQ5vfv
 SjgOS43JCEVWOZO/qB2s6g2JCek1lEo7VqXI4m5O5qjLpqNFXdtVWim6SX/E1SzL
 yasCK/nhu/fdaZkvt4NM3H3WIozK+4Z7VLWaf72s3/Lj+iGjZIP+oSZuoQcD/O4v
 22qMk5ekGf4hLaVpc/YwzSQZbXJnT8Z0fJ4OEFhoFKZ53w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc8ky1qgs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 30 Dec 2025 18:11:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4fb2f0cb59bso11380781cf.3
 for <freedreno@lists.freedesktop.org>; Tue, 30 Dec 2025 10:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767118301; x=1767723101;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HPNCoFW0b1ET+3JulFr+b4L0SqkCQC1DxA4qIwg6NPc=;
 b=LoYS38jUjCYdpqC3RMUeWpS3jpKvx2Oys1a2uKGr8MSeKCxd0UuTyIKfZr+8FZfBZt
 jE9NY/xKaApPf+VsEE88Y7Gsuz+NRFDLYu5mk+PMS5xVdDqSfegleShTT83SoY2xA2Di
 DzsvbPk+EGCzIBWB9LIsvLhcus7FrQeKm6yJnqFdT0iia7WDwCka+WkNuqa15O7grpsd
 n0xuUiDQ6a2LgvUFhaFlywr2u5kTxNCQemr0EGwx9K48QHBA414hSSd82WJdi6QoRV0j
 NMWt4i2dmpaVTqgODEBfPf901g8izYpjgpfmJdMjnbslKgM0F2uasvFmsbCeRJtOvGIz
 4TSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767118301; x=1767723101;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HPNCoFW0b1ET+3JulFr+b4L0SqkCQC1DxA4qIwg6NPc=;
 b=mBBKtOsy11r/pomKPlcj6PF+KAGKklEjt+mgEPWv+K6m2vMld5OnZEE5JD/H60u/Lf
 7xsLTrK36SBJrmNt9G4lsqN0c/hhH+D8L5Wl/YiiCLgrQf1runZK56WW6fFYidVA6RTJ
 RferEqZJKQKEvrrgzFOB3FMdn9w2v8JbBA8uBQZSGLgmH01lpVdNQDvcRPkOcPXf+jjI
 ni18hR5gQYWR9y5yGXVuIcRUjrL2DmFOIQSKVbJwML1mygjS5ydN5y1ti154rj8Lx2Dv
 +pbz6Q7iunILoF2k7zfG2GiDXq1WxLoq6WSQ7/xThZL/0g6DzLrLlhBBzvsxUmFF81Bx
 EtxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNf/CD23xU2KIsF9jjgWbl97tbyo8hcxYycONqrdLBniPXWxTkpDxtMfM969O3vJyLpfE4vvjRXpI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdM14vwIt0BD0si131bOL4nOtgmD87AXE15Erxb1Q3DmKAMXDy
 o0gqi6Wzou3zlE1PwTpBp9W3lYuQ8ew2BpB/yziL5IOx99FeWJugCd0ZValhnt9Oei4MP6+B9/i
 thFqwJbqf1+8tUj/VRDjld9wQPDZp8Db4tl2YiNkomIVTVYduUre9ORTMF37h7gJiJ1DQYkk=
X-Gm-Gg: AY/fxX7BKanvubABYB7iqN8WeeJXxmHdr+7dyh5nUEGvnYktvvEJQKO7vNcpNA5mIAi
 YYiQ71OZw2EYCKI3sL9Icp9DMq8coJHr8cvvxXlddFOszVuG2D7cbg/qpc0svijz8E6g1U48Xhl
 beEv/8GUVNP3yNNs3/QBim+dcy8pJKw846TbGpu23AaUsmNqCVXWb0j4r+R//wV0Cj90lTT6ysp
 1UMFyk4M3iuwboMpfM6bF7qkXLONPrU4gWVXTmi+WgGdSXxcmFbEzwOHQ8Wchcj9QHhJpiGEKej
 N+FsVGUbwUeyqYc//rvPQ0DKKDO5gUD5XjM+wq74ERbpRdJHD5iOQtAuFdgH1i75+XF//LVZVY0
 t1yJWN5ne90D8uViKBkeu87GDv0F3q0KBfbUiP1K1MH3fYkjctqWjehDbr+fI/0f46sB1kHOYAI
 4PiyF8poqsT6ea7TFmRao0sug=
X-Received: by 2002:ac8:6f11:0:b0:4f3:530f:d752 with SMTP id
 d75a77b69052e-4f4abdf0a9fmr509773071cf.81.1767118301275; 
 Tue, 30 Dec 2025 10:11:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIGCnUN1Iw2knaNpvsFWnvKFe/sZ9X6NUNsCPxK4IICAv/qOnSJjlR9vMcYrxElHEnMhkGxw==
X-Received: by 2002:ac8:6f11:0:b0:4f3:530f:d752 with SMTP id
 d75a77b69052e-4f4abdf0a9fmr509772661cf.81.1767118300838; 
 Tue, 30 Dec 2025 10:11:40 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a185d5cbesm10707751e87.13.2025.12.30.10.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 10:11:40 -0800 (PST)
Date: Tue, 30 Dec 2025 20:11:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH RFT 2/3] arm64: dts: qcom: agatti: Add CX_MEM/DBGC GPU
 regions
Message-ID: <n2tagk2qxv3bhblivjjhrjaahzhyscz4gi7s2vvwadikgphtka@rxv7rmhxbshn>
References: <20251229-topic-6115_2290_gpu_dbgc-v1-0-4a24d196389c@oss.qualcomm.com>
 <20251229-topic-6115_2290_gpu_dbgc-v1-2-4a24d196389c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229-topic-6115_2290_gpu_dbgc-v1-2-4a24d196389c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDE2MyBTYWx0ZWRfX8NHS3OgexuO5
 gujwXlD9T6W/UXArUABr7oTBLeSSxf8EF/DjCGpwtRa1ylfeiQXfu6z9H4DaDioksJ7///6y/66
 kcaa7QYj3IeB0muuj5PhiJZcBFnqZDbMhjQdqAPr8hJSt3TTJ/gFZySw0HGE1N8F7mQ+GyHRNr2
 +Fi4DVccoM38uMNBOhHLBOhz755nZtZrJChJVoF4HxM41wMMa1KFEVxFuEL3Ne0rjqStnbHP322
 P5zkuF6/hxIiB4DVVP5kKRd7OROffKuJ10ExrrxjGkJ+lFyXL1H4Tf2AhPkyS0Hen6nPvIeeIB4
 cNq96/4v28Mvk3zzVsWeSXEXqZLRgAqABKhOp9uGYlxEf1QK7zbzBZF4Mmm4PDdXSMdxsbh9KGB
 /OhYkHAbgi9GgiIRw7vFISldr4XG94S2tVHaRioaX68xzd/IzZ5Xn5qOLp1lRVkswyUo09Tz1d7
 baR2g9/5V9JzgSFnCtg==
X-Proofpoint-ORIG-GUID: qXIFg97mDAGc9qb_RIvXyO-hLXGUEFmV
X-Authority-Analysis: v=2.4 cv=BuuQAIX5 c=1 sm=1 tr=0 ts=695415de cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZSAiGDBkxcGykqJOsrAA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: qXIFg97mDAGc9qb_RIvXyO-hLXGUEFmV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_02,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300163
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

On Mon, Dec 29, 2025 at 09:47:40PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Describe the GPU register regions, with the former existing but not
> being used much if at all on this silicon, and the latter containing
> various debugging levers generally related to dumping the state of
> the IP upon a crash.
> 
> Fixes: 4faeef52c8e6 ("arm64: dts: qcom: qcm2290: Add GPU nodes")
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Closes: https://lore.kernel.org/linux-arm-msm/8a64f70b-8034-45e7-86a3-0015cf357132@oss.qualcomm.com/T/#m404f1425c36b61467760f058b696b8910340a063
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
