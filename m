Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBBEC2670A
	for <lists+freedreno@lfdr.de>; Fri, 31 Oct 2025 18:44:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC63310EC02;
	Fri, 31 Oct 2025 17:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KQvCDgXx";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PrnAT1sw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701E710EC01
 for <freedreno@lists.freedesktop.org>; Fri, 31 Oct 2025 17:44:57 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59VDDrfV1827335
 for <freedreno@lists.freedesktop.org>; Fri, 31 Oct 2025 17:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=vvHKLumKKaVNpfG3W6t6aYP4
 CbJ/5LJdAfa5MGOu8/4=; b=KQvCDgXxzqVclXNmB/ngqm50Mk7X6iKbKzWhNvSZ
 3UOCW9qdgrNnEhPbnfM8eiYiRoHX03qLmUAIo1ISyAVsf/690rZHRCi212QFmYoC
 MxwhMx99YqoMX4x6p0oi5H0zFOziho/1iXldgNH5SYdvwKq9ArNlY8vkFBMgCGH9
 t34Kbv/jT5VjbaWOinGglah/q5jqQYRwHShskdT4mhcytUeOu0E4/5eKkbBWStil
 +Zp2V8ITUy1QEUpi7Le4mhpRqu8dnw4c8VOuus9SW18opppNxMnwLGbfy2aWlp7S
 7zPJDOaOJ4agF8YSsEARJozB5mkk2aqGY3U/7ZV/q0K15Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4p11t4na-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 31 Oct 2025 17:44:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4eba1cea10dso86532711cf.1
 for <freedreno@lists.freedesktop.org>; Fri, 31 Oct 2025 10:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761932696; x=1762537496;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vvHKLumKKaVNpfG3W6t6aYP4CbJ/5LJdAfa5MGOu8/4=;
 b=PrnAT1sw/kZn5qObwWSkA/kjiMdtQVEJ41dVaNCutGdjv8ubZwR5NUy4fTlGPIcKuV
 0ADNzxv39fm7e0ziIfRffJnmN15BR0pVbDNO3UWFDv2NlGSfpVemF0zqsGJSTnUvM38I
 yACSTnAjv8EzUlbfUq8g6/HnMh17tDhBEaCR0qOIsKcY/kCoTRxcjZePDQgsuXr11XSc
 UzDEZFD7+Ye8n/MCYe08ttzBlYfXt+qyS7NPlJhPrfawV2wRDht57O8ypevpfdH63qsn
 870i+qxNpB5hVd+CojsvTF5M45RnwhhXf9Wt8m2F8VUqLW2hkLsBNa8alObtIJi09Rdt
 4SBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761932696; x=1762537496;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vvHKLumKKaVNpfG3W6t6aYP4CbJ/5LJdAfa5MGOu8/4=;
 b=JiGldcvxzsLuI1sMz269SOmjAq+u/cEAODAx67LxwYikXJIRPVnOmcCDQoZmB96ZYb
 2CZRqDwgyg6L3uVZqJ5FMlc+qO8z6VUJwQZBqh5WQASnt9Dd8ehzjLtWuiovl7BFLtmu
 V+RnX84+rfZdXvPGb/q8IHuNEZitLtkiFFTO/E0lJxq+e0yqZIt0dmDh/QWnsLICfYfu
 Dx0dC/lIRYxA2wI2vhQVk70HOW9lPihxSyv8F7dNyshMdFN74HFftY5+a7HylQOOXCxT
 GMWXFVGGSbVoYqqqrvlruiTFFMa6/qnyQQ3kisZ266SSbRBHmyqvWyW5qgVTg0f6bMwv
 PMww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhVna1XELvvbQJgmD4burLv2EGwdmXvaeNV83z3NhvTZ+90vqEMNnH/gRQf1XE/Uz2Xs5YBIBHqL4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+aOvbMT64tlI2zfwuyfZTTsVp/PGbEXKugdRN/hlYUg3aGggf
 PNN4CJVqebSlfqSTeBHeGwxGBLJM+OZCSTrq0IN/Oo8ynhlK5mmGInbc3sO/WTm6ruBoZ2YT+AN
 5CBLatsI3ax5+V65eIxAHuCuJicxb6GppcLrHaJ8Ct0kqg73m7Yz7kVJJ3xXGSaq2GWusH3I=
X-Gm-Gg: ASbGncvv2Q4V4BpE0CKOWtxpC3ZqKPzwWBpF6BqbxXtGx2dU2DnaNQEmBHhBrbnIjLL
 asU6wKNKEJYwZK0R9GuAzNzdxbeKjQS3UAxmAT58V1DcOnd3GXVRIETGc9XJG/ujDnJiaSUwlhg
 iufie+gyCYT2UEn44Tm4j+BJGfhhvyQ5IWg6HhL1Q0aJt27CAlr+jaE256GVkbWwtXQFBZ/0BgW
 X+0a5Ht0XoBw2QkjvveZgIkhIXTMD6q+XCslxTn0Lnc2siL8+V2Hd0VHpHhUx2MMPFmrtP2Ab5B
 pMmFLqQn6ZdFqPFbG3umHQqJ+86+fUSBpwC/M+V1Jc26l2OulYwx6+T2FM6tYr1LR/pqUsKBqdI
 XKxyaF36MuycRN1OlkyNNdln7suu9L2FoNq3HxsRMMOeQSv8wV1CxKBDxzRNubBEhbBI7pGyEt0
 saXp8n5OJZWFq2
X-Received: by 2002:a05:622a:1aa4:b0:4ec:f4be:cd9e with SMTP id
 d75a77b69052e-4ed3109b8f2mr50682751cf.73.1761932695712; 
 Fri, 31 Oct 2025 10:44:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9bEHzE8FUhJ91Y/44yaTELcPDElgy8o9JtMJnkidFrR8S2ct4TEYiKDSKIhS6PFHQgLRXEQ==
X-Received: by 2002:a05:622a:1aa4:b0:4ec:f4be:cd9e with SMTP id
 d75a77b69052e-4ed3109b8f2mr50682271cf.73.1761932695194; 
 Fri, 31 Oct 2025 10:44:55 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5941f5b5cc4sm639106e87.72.2025.10.31.10.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 10:44:54 -0700 (PDT)
Date: Fri, 31 Oct 2025 19:44:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, robin.clark@oss.qualcomm.com,
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
Message-ID: <epz7tibi4kduo6agfirr4fe477dakdccwob4xq2nz6qkjqakr6@jmweqjka4xgd>
References: <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-3-yuanjie.yang@oss.qualcomm.com>
 <wuh7agcgg6spghilnx4amqukaaydj25u7kbdiod7fl6pu2ulvm@pmosyuo43cyw>
 <aQF98RvLuOlJZlFi@yuanjiey.ap.qualcomm.com>
 <38c8e26c-08a4-42d9-8f6d-93969af90d50@kernel.org>
 <aQLOaI3ngjswi7kd@yuanjiey.ap.qualcomm.com>
 <7c1e0cb5-2483-4efa-be52-84cbe5d1a4b2@kernel.org>
 <aQMOz4P2/WyjXy1b@yuanjiey.ap.qualcomm.com>
 <4e444fd3-b079-4e0c-9449-1c119e1d710a@kernel.org>
 <aQQevC/Jd76rTNSU@yuanjiey.ap.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQQevC/Jd76rTNSU@yuanjiey.ap.qualcomm.com>
X-Proofpoint-ORIG-GUID: NWu4lOD73T0mhOMCMQaYtLfjul40UFHP
X-Authority-Analysis: v=2.4 cv=RbCdyltv c=1 sm=1 tr=0 ts=6904f598 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=SA9wRs256TnAP9KdDBoA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: NWu4lOD73T0mhOMCMQaYtLfjul40UFHP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDE1OCBTYWx0ZWRfX+X5tDV/jbO3Y
 +ud3ji8CN9Uwy6Lp7UDjXb2uaaTRodslzbSVd9TAouKdz/VQ6bm3pONduWMrViTGK1Kn2Ax+f2I
 Sdc9CUHhbQz3NeRpbKts5Ap33Nr702+T5SdcgfIJNEyfXi7KRTRMREm6sjSusZCfZlAM8Fu5qyL
 69MeKqf3kvwZ3yTdBoV2jGXRBf6Rgg4Tp+PLSqNe8i9LYKZAn07Modp1ArIvd+1BFt1MTLExg4n
 ARJaGKQ7QRSDAARSDF+PPRhBEiY25XCaaTnrmVkAoCgAcNnvKgNhPhw3Qxe0xKlzJ4zL9szL9vG
 m2U1icfkixqQ2arx0/QsV/n77Rm0rpSpNDBKqXuyFDUKT6P6X462N//jH+l8jwSRvxlFgtrjqsn
 zDVGGOP89zdkd8wXIjLUUP0cBnvuWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310158
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

On Fri, Oct 31, 2025 at 10:28:12AM +0800, yuanjiey wrote:
> On Thu, Oct 30, 2025 at 11:43:49AM +0100, Krzysztof Kozlowski wrote:
> > On 30/10/2025 08:07, yuanjiey wrote:
> > > On Thu, Oct 30, 2025 at 06:37:40AM +0100, Krzysztof Kozlowski wrote:
> > >> On 30/10/2025 03:33, yuanjiey wrote:
> > >>> On Wed, Oct 29, 2025 at 02:05:20PM +0100, Krzysztof Kozlowski wrote:
> > >>>> On 29/10/2025 03:37, yuanjiey wrote:
> > >>>>> On Mon, Oct 27, 2025 at 10:51:23PM -0500, Bjorn Andersson wrote:
> > >>>>>> On Thu, Oct 23, 2025 at 04:06:05PM +0800, yuanjie yang wrote:
> > >>>>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > >>>>>>>
> > >>>>>>> Build the NT37801 DSI panel driver as module.
> > >>>>>>>
> > >>>>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > >>>>>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > >>>>>>
> > >>>>>> You (Yuanjie) authored the patch, but forgot to sign-off, then Yongxing
> > >>>>>> provided certificate of origin, then you provide certificate of origin
> > >>>>>> and send it to list?
> > >>>>>>
> > >>>>>> Please correct.
> > >>>>>
> > >>>>> All the display patches were jointly developed by Yongxing and me.
> > >>>>> So every patch 
> > >>>>
> > >>>>
> > >>>> So two people were working on this absolutely trivial defconfig change?
> > >>>> I have troubles believing this.
> > >>> I want to say these patches I am first author and yongxing give me support, so
> > >>> I think yongxing is second author.
> > >>>
> > >>> I want to express my gratitude for Yongxing's support in every patch, so I included
> > >>> both our names in the sign-off for each one.
> > >>>
> > >>> However, if my intention causes any trouble for maintainer, I can remove Yongxing's
> > >>> sign-off from this patch.
> > >>
> > >>
> > >> Please read submitting patches to understand what Signed-off-by means.
> > >> Otherwise I have doubts we can accept your patches - you simply do not
> > >> understand what you are certifying.
> > > Thanks for your tips, and I learn some tips from submitting patches: 
> > > https://elixir.bootlin.com/linux/v6.18-rc3/source/Documentation/process/submitting-patches.rst#L524
> > > 
> > > I thinks below sign should be true, if you also think it true, I will use it in next patches.
> > > 
> > >  Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > 
> > How does co-developing match what you wrote "give me support"?
> OK, I will fix sign, will keep sign below in next patch:
> 
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

There was already one and it doesn't help, because co-developing means
actually developing together or one after another. "giving support" is
not co-developing-by.

> 
> Thanks,
> Yuanjie
>  
> > >  Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > >  Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > 
> > 
> > Best regards,
> > Krzysztof

-- 
With best wishes
Dmitry
