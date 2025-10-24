Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F61C0554E
	for <lists+freedreno@lfdr.de>; Fri, 24 Oct 2025 11:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFDA710EA05;
	Fri, 24 Oct 2025 09:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QguF7XEk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E3D10E9FF
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 09:28:29 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FP6B003425
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 09:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=zGkcT0F5HdfRvmdgOmrFrIfL
 DkdtJXkgEZhfMIxuKyA=; b=QguF7XEkUeOh2E3pknh1RhOE8KhIQT1c2uP+IQ0G
 zX/1juHpOOEgEAb2n5P9kAUK8s7h/r/ztfyqrAjbkoZDG/QlE2jUapvWcUZ7+01k
 IpUUGvjz7ZBKuL/vEafSBXLPqVZcft/UJlDHrY8ogrgd3k31WJtotb9RXel5w+Nt
 0crZWgRXZMURhLZDg0xZO/c80EjdibmbPGGwqO2U6xm/OYF+YCV7jsFsFGDsE0y1
 Sd5iNhe+3glckfGyogGvxX912c1IsECwYnzbfIdVZ5jeiv5/5N9uZFl1zWzeRAQi
 OCxz2WyWH1NVxvk9mdU6hMl5AP8n8YOg7e4YzonE6ynTCQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27jberh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 09:28:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4e89f4a502cso51179391cf.2
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 02:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761298107; x=1761902907;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zGkcT0F5HdfRvmdgOmrFrIfLDkdtJXkgEZhfMIxuKyA=;
 b=UTlQuM9cSFGoEs6IgFQN5EFm/20SF2boNq7F7E6jwX1KbUXu0413orM5BhPb6BMOuI
 P5l0MQZTltreTeLLSeJkjjqmlzv59l/e0sUO6DPu9/iIzMj/Cr1yY07lf9HSEOlIe+Ug
 5YtH6wEJNccYyLUiAZlOv3pNqFiItG/Nn5B5pCflqLUH+tTNarRQ5mPrt2PClPmkUegh
 tCN4uDScP8yrYo4Sm0GXreBHGHu/4yvvEJ35Ezdkb2FB3DkygFj1dzF078XhgcwxeMRI
 5sQvSkgCLYOtARNOHmaI4OvWv/FOGbY+SM1QD57BGwDW7yaQwoPGFEJXmt4gFrHVzoOR
 PTCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKlZxXRPoMqosf6W2HLTMn4mMe+SeFhsmcd7+pRV7gG6bbtLZVGg8L/5WtB/9ydK1COOet4ao156g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZbKiUe/xVcy1gegOoyfaZLk88QrfHALQ1ZR6AAyECZqCiXoDv
 tH2rnNlqortaF2sqpWiLUam4TcZ2GPvsVVVN2dOJZ+SxGr2VuICGCVRNUWwJTcVBkXLGVDZHiQB
 q5JHocb79P5IlWZgDC/GwsqezyVRihNwuLQcfMHi5hjlEghkuQqnNWe4F+GBTUu5b7tDKqM0=
X-Gm-Gg: ASbGncvlj8e5BHMbO5GBPtf99Hr61MG5AeRxJcdf2AKJDqN4PU6Rq7bUXFtWpUMuRW0
 sxt9aESJlQWuEru4RBvVFHbWjad/BIvqMYHlmFjuX16apIBa1tJhvDSPuYmez3EBwbf0LQgSoQ1
 F4wuEFOngfIP8KjKQYuQVNw3nMQRQutrpIWYvWdb+QIs81P1MkpHK7xqda38H/pRsLCasp3iHps
 EbxbszM+T5gcdiF7xsyilOxYGo/r2Y5Sb1QniC8CK2K5pEEMT/ZBjI7494PNvrVnmkIuNXjGJNd
 wJihhZQiFqcllyY2iSIROSH8oaV3CopfdIDFO0Rnx9MOPbTM8Hnv3UjmC6LWkMD+c4vyF4BdrmI
 o6YtCH024g4wmjo/X/4S/r7haWEPxae51ZkKG1Edo5a75K7/bgtdWcsXnrg8K9LMHpDMoNsTFtJ
 dEJ8GWPt4p84Vi
X-Received: by 2002:ac8:5881:0:b0:4e7:28c4:6492 with SMTP id
 d75a77b69052e-4e89d2e9159mr345062081cf.35.1761298107589; 
 Fri, 24 Oct 2025 02:28:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg7yl9p+wm1YmrVjaFh115CT4BHZ4Az1ybfHc7KF6ROWYFgbMv01hIcBHSAkMse1hgWxSIKg==
X-Received: by 2002:ac8:5881:0:b0:4e7:28c4:6492 with SMTP id
 d75a77b69052e-4e89d2e9159mr345061771cf.35.1761298107121; 
 Fri, 24 Oct 2025 02:28:27 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-592f4aded51sm1489790e87.23.2025.10.24.02.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 02:28:26 -0700 (PDT)
Date: Fri, 24 Oct 2025 12:28:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH 3/6] dt-bindings: display/msm/gmu: Document A612 RGMU
Message-ID: <qcs6y22hozfmb2ipmahfw25m2xti2gr5kjn43c2woiueqe4xmd@ovnrhwibhhe2>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
 <20251017-qcs615-spin-2-v1-3-0baa44f80905@oss.qualcomm.com>
 <8f3f4874-2e82-473e-87bd-e3bd58089b90@kernel.org>
 <181af756-09a1-4694-98c4-53cea556e172@oss.qualcomm.com>
 <ff37b635-b3dc-4180-8eae-e798ef6ce55a@kernel.org>
 <f677f8ee-d635-4131-8ee2-8ca6ead43095@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f677f8ee-d635-4131-8ee2-8ca6ead43095@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX/upg+1gBPBHI
 jNN2j/UjudUXaMaJP0MWv2Anp/TnMcbwaEeK7jyHMFRL9yJS0eMQPNXqAz9wGUzVrig5QCqv6zG
 wdUG69VWFUsFPKzXOUu/g9UpF0SNoB34M2NwJVTNTuMNDMZFyQxvJdY54O3JDeADR3OR1w26qpe
 gXMiivaivpEvEL5Cx19WW2EqZCaRwpdJG/1u846G+EkuVyaSps7MY5oEenplgATFdcHg/nIM4jA
 L1z62/eo9cQWQ8ih0OHN+0QHa8PzgVaMwiLtV/bnBjG3b643ABuTD8AG/PRSJ2+rE5ozFa9vK5k
 ElC3zGytItByFCKkmtMKdBe4Z4A7PCIW6Ku2zsqVQCpqwCngcWnRV6xhhmanZ+dOkYhXbev0yic
 LpXLPeYpb0CKFfrl3b+xkR/UjD8qCw==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68fb46bc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=QZfYkoQWqmGXo21g0SUA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: jUTN2JSMhvJjIMfuJuPJq4fwYS1EPdCn
X-Proofpoint-ORIG-GUID: jUTN2JSMhvJjIMfuJuPJq4fwYS1EPdCn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018
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

On Fri, Oct 24, 2025 at 04:33:28AM +0530, Akhil P Oommen wrote:
> On 10/22/2025 12:49 AM, Krzysztof Kozlowski wrote:
> > On 21/10/2025 17:51, Akhil P Oommen wrote:
> >> On 10/19/2025 2:43 PM, Krzysztof Kozlowski wrote:
> >>> On 17/10/2025 19:08, Akhil P Oommen wrote:
> >>>> RGMU a.k.a Reduced Graphics Management Unit is a small state machine
> >>>> with the sole purpose of providing IFPC (Inter Frame Power Collapse)
> >>>> support. Compared to GMU, it doesn't manage GPU clock, voltage
> >>>> scaling, bw voting or any other functionalities. All it does is detect
> >>>> an idle GPU and toggle the GDSC switch. As it doesn't access DDR space,
> >>>> it doesn't require iommu.
> >>>>
> >>>> So far, only Adreno 612 GPU has an RGMU core. Document RGMU in the GMU's
> >>>> schema.
> >>>>
> >>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>>> ---
> >>>>  .../devicetree/bindings/display/msm/gmu.yaml       | 98 +++++++++++++++++-----
> >>>>  1 file changed, 79 insertions(+), 19 deletions(-)
> >>>>
> >>>> @@ -313,13 +360,26 @@ allOf:
> >>>>            items:
> >>>>              - const: gmu
> >>>>      else:
> >>>> -      required:
> >>>> -        - clocks
> >>>> -        - clock-names
> >>>> -        - interrupts
> >>>> -        - interrupt-names
> >>>> -        - iommus
> >>>> -        - operating-points-v2
> >>>> +      if:
> >>>> +        properties:
> >>>> +          compatible:
> >>>> +            contains:
> >>>> +              const: qcom,adreno-rgmu
> >>>> +      then:
> >>>> +        required:
> >>>> +          - clocks
> >>>> +          - clock-names
> >>>> +          - interrupts
> >>>> +          - interrupt-names
> >>>> +          - operating-points-v2
> >>>> +      else:
> >>>
> >>> No. Don't nest multiple ifs.
> >>
> >> I guess we should split this. I will add a 'required' constraint to the
> >> rgmu constraints above. And apply the below 'required' constraint
> >> specifically to 'qcom,adreno-gmu' instead of the 'else' fallback case.
> >>
> >> Please let me know if you have any suggestion.
> > 
> > Maybe the binding is getting to complicated and RGMU should have its own.
> 
> There is just a single chipset with RGMU and we haven't seen another one
> in the last 8 yrs. So it is very unlikely we will see another one again.
> So I feel it is not worth splitting this file just for RGMU.

I'd second the suggestion to split the RGMU schema. It's not about the
number of platforms supported by the file. It's about the clarity. I
think it would make the file easier to read.

> 
> Let me send another revision and let's take a call after that.

-- 
With best wishes
Dmitry
