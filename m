Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 563DCC82A05
	for <lists+freedreno@lfdr.de>; Mon, 24 Nov 2025 23:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0465A10E275;
	Mon, 24 Nov 2025 22:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IX8JCe81";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="as70UOkd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17B510E275
 for <freedreno@lists.freedesktop.org>; Mon, 24 Nov 2025 22:10:37 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AOJrxcT892966
 for <freedreno@lists.freedesktop.org>; Mon, 24 Nov 2025 22:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 P1IkRQX90E+6SINHSGTIxDgXOYU24GZeFnRVS4Zye7g=; b=IX8JCe81aZ4Z96ad
 LQ93m1F98NWgE2XRNocVygHnvwMc6pPv1IGhmTGeXZXEiwBpVbABwFB/Md3+rF+C
 nRBdK8UnvdLQZh4XU0JcNnIkdhgYRqGY+nOLkFZZ2jTaoZ4+VfSx1OHoOXmQdRIB
 dJxsXD8fTn/RD/AVsDThTFaAfNF5NHxrmgA4YxRvVI3dcQ3rWXtlknGEU/UvrvJ5
 QE1lal5uNXo6TAa5uiQ5fmvMAL6Wei8+tiu8oU9jruplalbakG36bFa8Ln5e2gpW
 vh44BBkQF+s7PHnLtZ+qjnC1z3iomsRiCkOJpZXWLya7JB2A/l67ZJ0p3HeayXWP
 xvqMuw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amteb91cu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 24 Nov 2025 22:10:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-299ddb0269eso60190165ad.0
 for <freedreno@lists.freedesktop.org>; Mon, 24 Nov 2025 14:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764022237; x=1764627037;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P1IkRQX90E+6SINHSGTIxDgXOYU24GZeFnRVS4Zye7g=;
 b=as70UOkdDi+dAGe36wW5+JveUig3cm1Zi7QqLwbkUkl6i9Ni461GNbj7N0qDywoozp
 ol4HnhxHIyb4JnHOaDW13gZozcN9B/c52HMBTBW5tcMNHAklbNjOtu85eW5tlS7KgTbQ
 zTVq1bMdAAkQWRfsjWhTWKWGNivDp7ECiztzbpODjVPUYPSs3M0/N3tT/JBNbTETkHVD
 68aoA0n0FHUoUBjw/wosDyokpi7/9Nn8sw5H71ChzKFn0SXMzdu3zQ7npHkm+qrWf+P4
 iLQvzJB5vobhK46ixPXIdYy7VARLhmoBsYjgFpJOvWlRDr81fKPI2pv67iozgORrz9ym
 VZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764022237; x=1764627037;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P1IkRQX90E+6SINHSGTIxDgXOYU24GZeFnRVS4Zye7g=;
 b=sH32aSdIxJeB9Qh+NzUBMZ15ArpCIWaQjfgi+M0RGUYGwGjtY9ZrB5rtwf493S9JRD
 sNKAFhXSi4WImdfTmwRe9YQqA1X1cpRr1e1L+2GJv4AgiA3wz88XCX+GnS8mntgyorAW
 Vsu8iaFukROjtiSVu1XNTZnTx/1gABWDYvJwtrqfII8GBNU7oJvQN4KLYFvRdCMHt5qM
 8lGcpK92xvuw84FoyOOgECiB3IoYwNyOdcu7c715ROL2CiUmWkoWrcgpHQaWcmzKKE3i
 4ZBr2J9T33anmDM2pX5ZlA8pAaq+bd8anzx4MT3VCnpo1DMfJhq7X8r95ZKnfsIaBQHU
 6AYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkvje+C5vPzdPtm/OzpWWt1bQPS29j2v2mH7rPxeIqRaPHDCQvRWGOWJQ1pFqwZsg83mh3IFNC/yk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyO4l8Sv3buomj2VjAyY/jpg/LcZRL1LcHX+qbh9FkIaPRKCc75
 DIG0vsxl/b+i7YFmeWsLlwPZI/Sca5aBx5F1BfmTgOzB2rDYSRge+Kf8+QN//6ZjyBNr6xXrs00
 GTjENO5Tdtf3zqRkePsP7ylCgq/AIpOWY5gofnpB+qsyD06QgAhZ5Z14OCjX6689Jwg8/VjY=
X-Gm-Gg: ASbGncuA+5R3/ZRZOhjzWVPlIXUtpn/j8ecFDKCEuRvAT/7YK77Rg/NfNoi1ki1xAZ8
 JkFVsmyn7yYVT0Vgs9Ow36AUgpJIqOlH/CNSj5vjo8ZInRx52ugbnYK8CXTAhVB6lk7hK9Crxmg
 auAgB7KKY8xcHGro2F9tmgAzdu4H/EURoFLAEbFg5O0SRBNCHnTyGOfX3hh8FrSCTD6A8J2o5oy
 +0iC/HBnoTyp2vOnJMRoAPLblBw0xZTQP/ZkCwoc0BEAAoDB8GGXF8eT/0LrCcpddQyuK7Aji93
 fzG2jFj9z6p/17+6c0BDOAR+fPAFqW3MPhEr0TQpD2cutrX3vp+W4GR6+LxJYJ3N5Ny5DvbdjNJ
 8vwXlZuF3nUB3a3hR+E25I+4b9befLSCEvbo=
X-Received: by 2002:a17:903:1aa5:b0:298:4ee3:c21a with SMTP id
 d9443c01a7336-29baae40a33mr4509195ad.2.1764022236556; 
 Mon, 24 Nov 2025 14:10:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCFlcdURGFYX9T7gTdXnUcf8Uq2t38PcEn5iAANu+rMB94bLXIscK2ROxQ/LO/fYuI22iQTw==
X-Received: by 2002:a17:903:1aa5:b0:298:4ee3:c21a with SMTP id
 d9443c01a7336-29baae40a33mr4508935ad.2.1764022236070; 
 Mon, 24 Nov 2025 14:10:36 -0800 (PST)
Received: from [192.168.1.14] ([106.222.231.199])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b1387e3sm142941995ad.24.2025.11.24.14.10.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 14:10:35 -0800 (PST)
Message-ID: <efa2f4e7-97b7-465d-81e5-98d86975548f@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 03:40:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] drm/msm/a6xx: Retrieve gmu core range by index
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
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
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-1-9f4d4c87f51d@oss.qualcomm.com>
 <9cc55934-6980-4673-8501-2d1efe2f816e@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <9cc55934-6980-4673-8501-2d1efe2f816e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UGaFL-bHFKNK5KJ2WAbiZcpI8bw8G3L1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDE5MiBTYWx0ZWRfXwWl2lVbFGuSd
 164iJWXzqDfrysnfCCrHW/nwoBc6rQbPog1DDAat6rqTIDqXqeDSGckHCDL02MN0smSo5dF5JxC
 CFISmuhB7PZhLUaTeiBnXsZoErAw3s485ANtBxYTWwy6Me3rW9zNaPuL+GGFvhyia4ODDKF/Iha
 HriQSsNdS41kEEwrwBW+R9ZpCE6SRPQJuzE2q6WTWv+a49FGy7/vtsdOOOogT8aC2FaWWQjD4ud
 OiZu5mxYdg4bzgHxoKSUgsEiNq/szUi87kRJStWrwvk/l75RMLqu8+xCdjT1ESYZC/xwocmOlxO
 jrq34ExfPDMOgusfH0bE7k1U63gmKD8+gqi+y+OjiqX9KyClijp4E5wSi0bm8gXir+8ugTiJXZX
 4FGXFzzDZHM96gXaiypLfiwIOxugcQ==
X-Proofpoint-ORIG-GUID: UGaFL-bHFKNK5KJ2WAbiZcpI8bw8G3L1
X-Authority-Analysis: v=2.4 cv=d7f4CBjE c=1 sm=1 tr=0 ts=6924d7dd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=QME20dCx57Gc1q/4dZKLgg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6yKHOGsdPNW3Y-1pzmYA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_08,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 adultscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240192
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

On 11/22/2025 7:08 PM, Konrad Dybcio wrote:
> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>> Some GPUs like A612 doesn't use a named register range resource. This
>> is because the reg-name property is discouraged when there is just a
>> single resource.
>>
>> To address this, retrieve the 'gmu' register range by its index. It is
>> always guaranteed to be at index 0.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 14 ++++++--------
>>  1 file changed, 6 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 5903cd891b49..9662201cd2e9 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -2029,21 +2029,19 @@ static int cxpd_notifier_cb(struct notifier_block *nb,
>>  	return 0;
>>  }
>>  
>> -static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
>> -		const char *name, resource_size_t *start)
>> +static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev, resource_size_t *start)
> 
> Can we drop this and just use devm_platform_get_and_ioremap_resource()?

That's better. Nice.

-Akhil.

> 
> Konrad

