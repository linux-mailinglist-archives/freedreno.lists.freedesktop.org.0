Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A10DCA94CF
	for <lists+freedreno@lfdr.de>; Fri, 05 Dec 2025 21:53:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A35C10EBB5;
	Fri,  5 Dec 2025 20:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LMcAOc95";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K9KVeZRY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3648210EBB5
 for <freedreno@lists.freedesktop.org>; Fri,  5 Dec 2025 20:53:18 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B5FBM6b887442
 for <freedreno@lists.freedesktop.org>; Fri, 5 Dec 2025 20:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=UYQU81Y6HLQpXXtuKLRqLyYo
 i+qOhrx18gQgzC4wJlA=; b=LMcAOc95i68EA+FSz5Ad5U66KYVwHQfWGYRnQCR5
 AaDoPGBp97UdjnuT1evFcmQOxipcQ6UqUmJPHk0EpMK+ZslPLGfC6OD51Cxn2AnI
 lL1TOe+rACGupzr0WAb+8Ut5YtVd2uPnBff/slyeCXcV0Zk1OL1LhdordBYmZ4kv
 P0e4slboGpVpnDiBwEhPsVAycuAIaAmLlAhNt+WbJvsh0Fbj2lxdXqHogciLgKw5
 lEDVGxo9UBgC79Pw6SrtL3NewyD5dTIAJ9ObdEv6wfnJHshcg8momHoxkXKQdXYZ
 rj9lantuVa4RC3hsBZquyexr2geIxkLZAeLn2sAx1okTMw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aurwvjj3m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 05 Dec 2025 20:53:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b24383b680so807993185a.0
 for <freedreno@lists.freedesktop.org>; Fri, 05 Dec 2025 12:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764967996; x=1765572796;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UYQU81Y6HLQpXXtuKLRqLyYoi+qOhrx18gQgzC4wJlA=;
 b=K9KVeZRYG2vpbjbdxuZDgvkzI7Od3ySuFkqyKpGlq7mEg0e80fCinlk15pf6uvyFiv
 9wEnktt4wxjbxMTwcTQVQHCIH6WTtHsPT2zy7l0u0YCYeZ3jnrW85puC0Hz2/9AlbJcG
 8vULdnmbUCpsCB+NFnlhfHfsDVs4bR8j4fCdU3t64x80G4Y42GuetuzkQAdRW40ApBmS
 5osz+0fGLNj2CssmIy6r33M7ARYK0BZDIPC8Q90RQ+YCUdCbf8pnz8PPwGG2riyHYXgQ
 4utUEdDpdyj1MqVUsNw1xD+vC+DlvyOAeluuxzMLvqsAzhNc9nfLgUWw07//PANZDOL1
 NfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764967996; x=1765572796;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UYQU81Y6HLQpXXtuKLRqLyYoi+qOhrx18gQgzC4wJlA=;
 b=k2/9/ENeM4VGQxOZ/nafGDplvlmwHcKurX08cuValegBny85Grs1xbiUVqg87OcHVD
 9Zs6suQ1X9ZgzryYlJY0FVfdhT+j1Qj6hfVP8jy4iAqzKgMdGNaJ+sBpBTJHuYo+mBA3
 TBHwN9Z5X67+cLd0DUltF4/vYX2KuQ9T9LglgjlYSAlN0SKz2yo7FVQymN02pazdUeAx
 mvJbZ21l+iwbGsjEYmt6VP+FWFj5kLrSzJGjSLkaE/MpvDI6r8gyYrIitTrrIFyTUpI2
 eFkVG4HF9SNip99g0B3l9Ew0J7aFEX4sHgsOKrH6t4bsd+bNBZcFJifgqKm7QiIZOBUe
 XmSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlxmLrMCgOOXStebOHlSukW3+jiIXDgG57YUpA4IR6PMIESu5TdrQ4EZ/cNwFLWpUgHeLK8gJ8UG0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz50tSUc6+4u+APCGOsT3VP3v5gpHQvSiEtYag5V+mCn55dFqo3
 oMU2d80WTX1Fb/RsbJ7pLypZxBd101cyInwOxppX34VnYWcoFbtvculJPtIZqIaOF6yKyo95mt8
 WrbVLZhbtBVUVQZ/Q6p+9SGe/OVxMA/ONTpsCWRKXjU4iTGKjmkzn54UG3acnZ3mJhvcmego=
X-Gm-Gg: ASbGnctP7W615JYMNpMMbTGrYqnmxJTSzJwU1HUxJzW4fS71XoXfdRsgtn5c7epCwzb
 XngQS7Py1ZKljhKQsFdHxKzzZ78yQ7mY3cvIoFX7rnxU6n5v+jH3s8HuXoXmgEaWxsXrvYDlG6b
 M6HXNOGqI2X4TkVAuKM6sHLPXd4lef5ScC4O81hdHf0dOs/KI6pDDvVowQdNGSB6NyTgvIbk2Hq
 PM2mD3CC58/CyK0iLRhzL9SqP9WajJNBQ9x/iEMe52/MvFrSLNEjZlUdmlskq2qRTGL8xqT4inZ
 Pw+o6rpHuyd9bAPeH5HLrFrE0jwk8XLHS1uDG/yukiVvqgoskoJUbn74R6/PR4tuX6s+BfQ8HD7
 HalsBj4DhwL755Y9vl6Dd4U80lY5R7YEZ7fLZ/xqpisHee6gyLbCmFq/1mcAg9P906cn9R0bBmr
 Snd8fVLW5WWj1+sek6t2Wxt8E=
X-Received: by 2002:a05:620a:480c:b0:8b2:9765:3a69 with SMTP id
 af79cd13be357-8b6a2586080mr56197585a.68.1764967996467; 
 Fri, 05 Dec 2025 12:53:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHe1aQZfNJvea5YgqM/l7S+IW0I6k1UQ3u3irgB+qt5cziGghA1+4KgLqtOSq6Ucuz6XlhljQ==
X-Received: by 2002:a05:620a:480c:b0:8b2:9765:3a69 with SMTP id
 af79cd13be357-8b6a2586080mr56192485a.68.1764967995983; 
 Fri, 05 Dec 2025 12:53:15 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-597d7c1e2fasm1850723e87.60.2025.12.05.12.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 12:53:15 -0800 (PST)
Date: Fri, 5 Dec 2025 22:53:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/8] dt-bindings: display/msm: gpu: Document A612 GPU
Message-ID: <iowdz6u6fw6cmgqkznxxmksz5tufkbgen2k2f2k6xi3fzwa5qx@73jldhd2yoab>
References: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
 <20251204-qcs615-spin-2-v4-3-f5a00c5b663f@oss.qualcomm.com>
 <e8243a84-a7bd-4087-87d7-2795d6bc7595@kernel.org>
 <aaae2ab1-04ec-4d42-afe4-7a2ed00ce903@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaae2ab1-04ec-4d42-afe4-7a2ed00ce903@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDE1NiBTYWx0ZWRfX785kzNBZfhMT
 zQGayAc26fhbqf7c1XTUn3mlw5bBke18zbPKRTy+ZRGbS06sAuVzKaqateMYU4I+LESkcVKtLiR
 dXr+4RMWdy1FJWYnStE/4837NOG6qqX7+DAAqE547P7henVs+sOmZXwejRiNZR69tt1Cqm/UOKe
 n10i4dX0HBBJZMSLP2dEIHaACAGVszWOcn6kZhy3Kj8lMQt0h9LMfxzPi6yjYSnGNQRe5YMGRwz
 502kJcDbgUylsBRMtcYdojqVuTR2ziDXssPjYYsf5s82C9YN5/aj+67CXCxYZ1nwONjw+okau4W
 xNPy5slmyAzE2gunDVrxS7NkN7RCquZXXCoj7l3LW5jySMeDGECTHxU0sYjoT0avPAFQpqJFq9e
 KnwobE2C6G/dSGEaX9SbJfxc2Gl23g==
X-Authority-Analysis: v=2.4 cv=Yd2wJgRf c=1 sm=1 tr=0 ts=6933463d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6r3IkYRDlMlQpd4nI30A:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 6_WEUrijOpwzop-TV-dCxr5cVnsr4aD9
X-Proofpoint-ORIG-GUID: 6_WEUrijOpwzop-TV-dCxr5cVnsr4aD9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050156
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

On Fri, Dec 05, 2025 at 07:28:52PM +0530, Akhil P Oommen wrote:
> On 12/4/2025 9:04 PM, Krzysztof Kozlowski wrote:
> > On 04/12/2025 14:21, Akhil P Oommen wrote:
> >>  
> >>    clocks:
> >> -    minItems: 2
> >> +    minItems: 1
> >>      maxItems: 7
> >>  
> >>    clock-names:
> >> -    minItems: 2
> >> +    minItems: 1
> >>      maxItems: 7
> >>  
> >>    reg:
> >> @@ -388,6 +388,32 @@ allOf:
> >>          - clocks
> >>          - clock-names
> >>  
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            const: qcom,adreno-612.0
> >> +    then:
> >> +      properties:
> >> +        clocks:
> >> +          items:
> >> +            - description: GPU Core clock
> >> +
> >> +        clock-names:
> >> +          items:
> >> +            - const: core
> >> +
> >> +        reg-names:
> >> +          minItems: 1
> >> +          items:
> >> +            - const: kgsl_3d0_reg_memory
> >> +            - const: cx_mem
> >> +            - const: cx_dbgc
> > 
> > The patch overall gets better, thanks, but I think I asked about this
> > already - why you don't have the list strict? I don't see reason for
> > making list flexible and I don't see the explanation in the commit msg.
> > Either this should be fixed-size (so minItems: 3 and same for reg:) or
> > you should document reasons WHY in the commit msg. Otherwise next time I
> > will ask the same. :(
> 
> TBH, I was just following the convention I saw for the other entries
> here. We can make it more strict. But I am curious, in which case are
> num reg ranges flexible usually?

This might be a historical leftover. Feel free to send a patch dropping
min/maxItems for existing devices, if they never were flexible.

> 
> Just to confirm, we should add this here for adreno-612.0:
> 
> reg:
>   minItems: 3
>   maxItems: 3
> 
> reg-names:
>   minItems: 3

I think you can skip minItems completely.

>   items:
>     - const: kgsl_3d0_reg_memory
>     - const: cx_mem
>     - const: cx_dbgc
> 
> -Akhil>
> > 
> > Best regards,
> > Krzysztof
> 

-- 
With best wishes
Dmitry
