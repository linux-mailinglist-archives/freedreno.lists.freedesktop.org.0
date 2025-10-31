Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C27C22FF9
	for <lists+freedreno@lfdr.de>; Fri, 31 Oct 2025 03:28:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA67F10EA9D;
	Fri, 31 Oct 2025 02:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cz5Qr348";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yos1Bxqu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51EE610E154
 for <freedreno@lists.freedesktop.org>; Fri, 31 Oct 2025 02:28:27 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59UKsQ8I832852
 for <freedreno@lists.freedesktop.org>; Fri, 31 Oct 2025 02:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=mygVM9j4kzb1+d6IfzSVkBIT
 dt7PzesZDBTeq/ZmytY=; b=Cz5Qr348CmuqAsqhgi/Yegi14vGxTJGQcvS7IfQB
 Hd4kOOTNW6ElOOv1F4iWmToN76k+trMWwZ50pJnHLaw5909zjN3C+jogxU6arsCd
 L7wvpsSd+InjEHyZpfWpxK6gq2rIAcqesLngWjxW14beSU0Dt4oTbiQ8K4luXrc+
 YdBbacjKqk5zBbHMm7IiYTmrSZ6KiCRyMUSG9rBCY/sIbw2xBl+6hZoyFRwmR7pX
 sgl/zkiVtiPi2ayh+vQm8ogPhtDqKYfRAKyly5Rilj8W1jYmALd5o/21I3DdYpYi
 OgScHBHjzTWfUzPFQcZg+6fALLJe+xEqDreHnMBRjb0JgA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ffb0nfq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 31 Oct 2025 02:28:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8a4ef35cc93so465069385a.3
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 19:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761877706; x=1762482506;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mygVM9j4kzb1+d6IfzSVkBITdt7PzesZDBTeq/ZmytY=;
 b=Yos1BxqurjwgXhmhPELXp9p3e6/lyvig7OhcDAA5iRfRCtjiN0I8oeGLeaM/ynJZ9W
 tPrqIX0wWNiDfloX+k2W/z5Jv+WKtHzZsLgEtW4bUkh3vEtIDsymO6K3tMJqZs6++Iff
 FOj5fS45sucgqGDmS9l5WUWcdGc0BWqfyFwtohzm9prwOg9OTDLpkLALHv4z54DWbAgi
 qLJE9Nrd+ghxj8TgpIfxraBs1smodNKIzgOHc766D0v0QEO8W18RFCsPfiSmdNaC73hS
 uIN3EMc5Xs1LDLdxamU1imfgJTGcwSz6hEQBoSrjNAHUXI9SFF3B6WgCSuyTIDJC/JWy
 /pJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761877706; x=1762482506;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mygVM9j4kzb1+d6IfzSVkBITdt7PzesZDBTeq/ZmytY=;
 b=Zf03PHJ5UnDGnEOzrBlz+368CfrJbayjNoTW/V/vUaN1qU9BjLupDpJ6Oxcs+yfKz8
 EuKLfiG7fWmaKSVDi7DeMlNig6i20okV3xkxrRBjUeLvF/fTfXA/nVktspXP7HwjSjpv
 QJV+9t4F97ehHFw2VM1RBDm32PMB3LrJHkal6xBrP6PZgFvR9WR0P1na4PSlQTCVY5kB
 K8nBI80zJ2bW5iIIPhhxoyUTugO08/PTeeg85/MawPkpV8ICvENL97QFVIS0Hwrnm9OH
 axFalS4CHGBxrbgDwSX1FUag1vVcqCFDwhV+2Nj/tZYL1u/L29c7gFjy9i7Ovld2lGbf
 DQbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcw+lg1+H6B4Hnt3XHNT60pP+REYNFB09aEEGH0HGwf74iXbbgcgfiqkRaui2Nq8wYstC9dlMB514=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxD+wVCrKHD5N2T0D0MxHmoyMEdNJAwngM3W2WmVkk/BHM8jczD
 6vzIjdrUdu1yJFVLUYM+LxajipaYPn4qYf509Kghy857gaVSn8LuIhF6QOeEJ7ia0a7xTygegKR
 qP7n/P64UdnklShkhnoEBMKTMkXvtRRrAg0l0rVwg/S6JgXSCsT+KsRmBs+keBOdq90+boVI=
X-Gm-Gg: ASbGncvmbnfWB3/jETARQP265DvJsTzjxm87aEEfBlVLudLsUGqOoz8eCcoFi8+yiJd
 ssMeX6gK5ELLt2LH8aaijCdVI6P7jOZfKUONjX1YSjIUPRIodrFE29ZqfkHsrc2U78MNi62MWVd
 MHRW5bxcXFBWTM49T68gFy3Zof0y8RVYBRHs/OBaDooW60BBIIwOYCyBKw5zIgKlVsAS8b1M1XO
 JfBddvucrYIMzXLe/QgGoKbeJ5kemIlXVNctWZMIMXM5oU9IWrt29OV3Qpb9zmT3iz2h1PxLpIY
 np8qp+nBtOXKTuFtyj+ge7QAOOMcpYHEYE/dDz3fHTS9ZUuI4YprupoWD02/NhL8Z5aOVpytaN7
 SBc5z4+tacsNT8bv/FNDJXmLprz7nc3N9o1BOP963fTyffE4gDALLLApqkMNg
X-Received: by 2002:a05:620a:28cc:b0:89a:2f9b:10d3 with SMTP id
 af79cd13be357-8ab98eba5a6mr237554185a.30.1761877705628; 
 Thu, 30 Oct 2025 19:28:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHr+5kD+JtS6mIytCdLqJ68RKUbehYh6oGlHnqbAxbfTUJ3LV9xtxz77D0wjhEnj/7Q+aRjjQ==
X-Received: by 2002:a05:620a:28cc:b0:89a:2f9b:10d3 with SMTP id
 af79cd13be357-8ab98eba5a6mr237551785a.30.1761877705158; 
 Thu, 30 Oct 2025 19:28:25 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8ac0106e063sm25886285a.26.2025.10.30.19.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 19:28:24 -0700 (PDT)
Date: Fri, 31 Oct 2025 10:28:12 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, robin.clark@oss.qualcomm.com,
 lumag@kernel.org, abhinav.kumar@linux.dev, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 08/12] arm64: defconfig: Enable NT37801 DSI panel driver
Message-ID: <aQQevC/Jd76rTNSU@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-3-yuanjie.yang@oss.qualcomm.com>
 <wuh7agcgg6spghilnx4amqukaaydj25u7kbdiod7fl6pu2ulvm@pmosyuo43cyw>
 <aQF98RvLuOlJZlFi@yuanjiey.ap.qualcomm.com>
 <38c8e26c-08a4-42d9-8f6d-93969af90d50@kernel.org>
 <aQLOaI3ngjswi7kd@yuanjiey.ap.qualcomm.com>
 <7c1e0cb5-2483-4efa-be52-84cbe5d1a4b2@kernel.org>
 <aQMOz4P2/WyjXy1b@yuanjiey.ap.qualcomm.com>
 <4e444fd3-b079-4e0c-9449-1c119e1d710a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e444fd3-b079-4e0c-9449-1c119e1d710a@kernel.org>
X-Proofpoint-GUID: UK_lK6_qRhF2ko6E3AZu_wCOZ6YyfrEr
X-Authority-Analysis: v=2.4 cv=fpjRpV4f c=1 sm=1 tr=0 ts=69041eca cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=wiB8FAKGFwBon0ndxVIA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: UK_lK6_qRhF2ko6E3AZu_wCOZ6YyfrEr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAyMCBTYWx0ZWRfX9vQMFq2YdrJC
 pNELTV+jNqZRgQ8+QO2qVuLpGBE5brwKB7JQ9GsqOTPyxZiaZmKQ15Y8V8JPc0BS5qnVyXdVSi7
 qrEr0on3WuAtjtFBJTWSQJ8E+NHckqIE9Id9mOkKrwaGyDzkoi3+er14x5rzenuSANib8kwc7RU
 D+jGFN07EFUXxW0nKxWC2HArrMA11/L7ac5qaDFH/xX8QpeSHM7ea2AzpLAsobV88FPa1huXic2
 csxI/S9fyNJ/xYNAss7m9nQooqSL7SxCmpOO30HKRG8JSDSYSlTP+uxJ0TonyCByklSBEFEeQtp
 /ezyfsO91iwTBLX4D4e8lR7uiI99FW6r/VvNzSHRj/suB5nG7boLmS222O9wzTndZS5roIzXh5c
 WfdAH/vYhC6RcDJwymq7l7BafoC23g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310020
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

On Thu, Oct 30, 2025 at 11:43:49AM +0100, Krzysztof Kozlowski wrote:
> On 30/10/2025 08:07, yuanjiey wrote:
> > On Thu, Oct 30, 2025 at 06:37:40AM +0100, Krzysztof Kozlowski wrote:
> >> On 30/10/2025 03:33, yuanjiey wrote:
> >>> On Wed, Oct 29, 2025 at 02:05:20PM +0100, Krzysztof Kozlowski wrote:
> >>>> On 29/10/2025 03:37, yuanjiey wrote:
> >>>>> On Mon, Oct 27, 2025 at 10:51:23PM -0500, Bjorn Andersson wrote:
> >>>>>> On Thu, Oct 23, 2025 at 04:06:05PM +0800, yuanjie yang wrote:
> >>>>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >>>>>>>
> >>>>>>> Build the NT37801 DSI panel driver as module.
> >>>>>>>
> >>>>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> >>>>>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >>>>>>
> >>>>>> You (Yuanjie) authored the patch, but forgot to sign-off, then Yongxing
> >>>>>> provided certificate of origin, then you provide certificate of origin
> >>>>>> and send it to list?
> >>>>>>
> >>>>>> Please correct.
> >>>>>
> >>>>> All the display patches were jointly developed by Yongxing and me.
> >>>>> So every patch 
> >>>>
> >>>>
> >>>> So two people were working on this absolutely trivial defconfig change?
> >>>> I have troubles believing this.
> >>> I want to say these patches I am first author and yongxing give me support, so
> >>> I think yongxing is second author.
> >>>
> >>> I want to express my gratitude for Yongxing's support in every patch, so I included
> >>> both our names in the sign-off for each one.
> >>>
> >>> However, if my intention causes any trouble for maintainer, I can remove Yongxing's
> >>> sign-off from this patch.
> >>
> >>
> >> Please read submitting patches to understand what Signed-off-by means.
> >> Otherwise I have doubts we can accept your patches - you simply do not
> >> understand what you are certifying.
> > Thanks for your tips, and I learn some tips from submitting patches: 
> > https://elixir.bootlin.com/linux/v6.18-rc3/source/Documentation/process/submitting-patches.rst#L524
> > 
> > I thinks below sign should be true, if you also think it true, I will use it in next patches.
> > 
> >  Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> 
> How does co-developing match what you wrote "give me support"?
OK, I will fix sign, will keep sign below in next patch:

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Thanks,
Yuanjie
 
> >  Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> >  Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> 
> 
> Best regards,
> Krzysztof
