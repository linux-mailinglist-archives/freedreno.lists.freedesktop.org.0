Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CA0C4E70C
	for <lists+freedreno@lfdr.de>; Tue, 11 Nov 2025 15:25:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB6B289ECB;
	Tue, 11 Nov 2025 14:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DGgsmsp3";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kmMGn9G9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFD710E07F
 for <freedreno@lists.freedesktop.org>; Tue, 11 Nov 2025 14:25:49 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ABBGsvQ2298403
 for <freedreno@lists.freedesktop.org>; Tue, 11 Nov 2025 14:25:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hGa7B98r9MqkGDgKlmDgrSnW42cjpgklRI/2tR3rrb0=; b=DGgsmsp3z5Kly49F
 2Hq/3japteXVdZPaeIYVZvju6RwgCftm3mwlfB5kZrBZWou2alIVyDiJ8gra/AKt
 NtpiSahSi/l9VMHGE3iqpp5/Z/mNQW4lcrVFjs0l8IB8Eo0+8fhBQBGUYJR+VO5E
 VTXGwe59agQekoRbgea8fGGod+LVAqjbQvsN7tLsxWYmq9mJ6RpOg054zekzaszX
 7oKmwQjXANhYnkw/Dix/5sc2qB6H/L8Qa6KyE/aKSFYuPecUakEW5SEf70FiMmvq
 9jl7LKoTmdduSKy3zuE+u8GXJV5aNOAFxGyBp4i2KZYpkxWRKK6eNZn9AWRurky0
 kWM9YA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abm4a37h1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 11 Nov 2025 14:25:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-29845b18d1aso5395075ad.1
 for <freedreno@lists.freedesktop.org>; Tue, 11 Nov 2025 06:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762871148; x=1763475948;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hGa7B98r9MqkGDgKlmDgrSnW42cjpgklRI/2tR3rrb0=;
 b=kmMGn9G9a0y6ScNZlZRgajIA4GF7ifTNiy1JfDJokZn6JqnfKJTrL6NjLnm9ZVtQox
 Fh93r2a2kuqFxozzzbsdJpFykSVdrCefuoXeCDWL3ePBc/xvpZ9AmGEQOTUBd2Nu0f3W
 cHmyo4jAl6JdyE6QsyGzE9dcjbY42bw4syEAzgMlYLerPNOSqhuA+wwl/jbWPEa80oEN
 LydxbcHi3mbrVrMoJufaTVEtMVYXdPtdCnXjaaMHjp/oCxBa+7Y+0rJO3o3EHi/dGTd8
 xgSsFZl2DjGU5FAkJ+S23fGKnhmCpFXjcUryASgiL+wJDtYGW1uFSdtMIXrrE2F202Cd
 NPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762871148; x=1763475948;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hGa7B98r9MqkGDgKlmDgrSnW42cjpgklRI/2tR3rrb0=;
 b=kKpgVmVNi16Ey5Cv1uA3y2O9dGV7UVs4Oc3tkIMLt/Bx5xcNVr/FiQvXFLUjhBEiRC
 pvp88zkts3+NsLP91NasghSkyKS+ZNGwl934E9tEzfavJxb/A+Gqzz0ZGVFw9+D5bQvF
 U1ZEgZIHaNXzkt/JYYdePDt8NnZjYt0g0sdSLwef+IH298wma5pdrdV02unk1+EJHdGA
 7iKbLCZcFO5K83tf+HNweHID6oiWnWPulNYM/pmxwHnt56k4F9SD9Fyl3P6iEaoWNC4u
 OlcpVVVZevRcN4TwmiIK8k/l+2+kUjeINvSmEdTOig47qthVEitVq3EyrSp6M+f8B3MI
 9tfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlG5gFFUWpOSWHt3JUKh6B4c2veRG6FVUkS5tWnyDB/Zh68sjIKgNCaGNKpMD4GO77Vv96dr8xH6Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywp/Sm7jV9guKEY7ZpwDR1Se53LL/yk35MtHIuhZ6JjJaieyyiS
 W5N2Er+2bD4ZTtdbHV6jUmt2v1kiTfJ5DoKl5C1LRmWDR0g+x8rFIKDLEl/516aZF8CdPdi43Nf
 SuNP9Hx3fIHL5nRdovKSUobAGsdQmwPgPoIem/0FHBcE7cfGCpbkxxlskiKAUKPHA/KUu1f4=
X-Gm-Gg: ASbGnct2UgXL6d0GZ3PYHjlVEKCwqHPC74Aa8IpN/FUSZLm8j5818rXbFY/OFpaBEQ9
 6FfaEPl5B4+w3ZAINj+mlM8pW4ApaULpDpB1AWeOVrkmLB02wYVMajH5dzjo7XyX3pvxG6hGtlT
 EUBydJ7ZTKCYIbpU2uGQ2/TtcBuegPqXVCwUXDTDZviXVSkZ13Tx/v7kdFTl9S+OEwTO37o57fA
 zf18n5IoJKiRY0nDjdWbSoHd8vfjoyeuw6LjQCKa58gnZ5DUnlphq5/Bw3c2hpyNC5SwGgt169X
 PNTFw+LWuQDnjim7oocY/KHkmu6cdCfE9s0y/V7i2KR1t37jAZjXmZB6zpJ6RvrEsrAIZ8S8gxt
 AJBNqk0okrlUN9vmo9A30Fw==
X-Received: by 2002:a17:902:ea0a:b0:297:c638:d7c9 with SMTP id
 d9443c01a7336-297e562e197mr179715555ad.13.1762871147472; 
 Tue, 11 Nov 2025 06:25:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkROrZLUIRrbkgoTAgkprVjqaX7dHmwbXmMslaYaaMrgNrailMFiy5g2vGuUSJjGn5syzSxQ==
X-Received: by 2002:a17:902:ea0a:b0:297:c638:d7c9 with SMTP id
 d9443c01a7336-297e562e197mr179715115ad.13.1762871146970; 
 Tue, 11 Nov 2025 06:25:46 -0800 (PST)
Received: from [10.206.103.12] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29651c740a9sm183312755ad.53.2025.11.11.06.25.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Nov 2025 06:25:46 -0800 (PST)
Message-ID: <ad372979-adab-4486-ac69-90a9df1ae512@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 19:55:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/21] dt-bindings: display/msm/gmu: Add Adreno X2-85
 GMU
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-20-bef18acd5e94@oss.qualcomm.com>
 <20251111-magnetic-jasper-slug-3abc3e@kuoka>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251111-magnetic-jasper-slug-3abc3e@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UnCgqyCyO7RMt1Sr_ti9wUyGs8m1jfv8
X-Authority-Analysis: v=2.4 cv=G6kR0tk5 c=1 sm=1 tr=0 ts=6913476c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=3RWeJ3mqlPvKrM-9dKcA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: UnCgqyCyO7RMt1Sr_ti9wUyGs8m1jfv8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDExNSBTYWx0ZWRfX3a+PSpoaDwuV
 LPyQGfLBesGJ1RVZDfmwK+qZlg/MBhfZ24N/UdOzPKyTQf+eWRX5Qh2qOitcOiuK1vJGdNDJydO
 3432yVnkVX354IjUm06V5PDkuBn78ll06YW7cU+g+TNsIg5/yaCdAvNRFvKI0ARZqr9Yp8iJDyM
 JAGNUQXJLEaED1itN5MzKm5GO9x+XNKQjmvJbjBXXPqt2dCxP+Te5s4vQSbE6SCTU4WpQC2+z+Z
 i2rIkui+EjeHd7Wh/E0feKjnURg/W1YrSDJLsUrcJgbm7CiRwugIT04y272JlmZu3wUNwzsErKm
 hWWZfRLdaeZIZMlIFTIQgdO+kIBIza4zgdcFFvuoGJ6mhvmJya1MbzVRlvP9PBmiOAJWlWfAPo5
 P1ILcmEObVRtORAha6xTDzDPSoFOZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110115
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

On 11/11/2025 1:19 PM, Krzysztof Kozlowski wrote:
> On Mon, Nov 10, 2025 at 10:07:26PM +0530, Akhil P Oommen wrote:
>> Document Adreno X2-85 GMU found in Glymur chipsets in the
>> dt-binding specification. It is very similar to Adreno 840
>> GMU with the additional requirement of RSCC HUB clock.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> <form letter>
> This is a friendly reminder during the review process.
> 
> It looks like you received a tag and forgot to add it.
> 
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions of patchset, under or above your Signed-off-by tag, unless
> patch changed significantly (e.g. new properties added to the DT
> bindings). Tag is "received", when provided in a message replied to you
> on the mailing list. Tools like b4 can help here. However, there's no
> need to repost patches *only* to add the tags. The upstream maintainer
> will do that for tags received on the version they apply.
> 
> Please read:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
> 
> If a tag was not added on purpose, please state why and what changed.
> </form letter>
> 

I think you got confused. These are new patches I have included for
Glymur support in Rev 2 (as mentioned in the cover letter). Did you
confuse with the other patch for Kaanapali?

-Akhil.

> Best regards,
> Krzysztof
> 

