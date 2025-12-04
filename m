Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B732DCA3D11
	for <lists+freedreno@lfdr.de>; Thu, 04 Dec 2025 14:31:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD8810E97D;
	Thu,  4 Dec 2025 13:31:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="akAP/UWv";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pzw10jnX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9629910E964
 for <freedreno@lists.freedesktop.org>; Thu,  4 Dec 2025 13:31:50 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B4CwrTJ1436678
 for <freedreno@lists.freedesktop.org>; Thu, 4 Dec 2025 13:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 O8v9MZRcYSWOYsXns5st4tio4IBnhtTaYNkIBg1TWH8=; b=akAP/UWvqksz3lyA
 8Jph2gO2naruzdQK+Wwm2EttLRqlfR/rBsZPsFn3U+LQABu0+s1h8Z6JuDN5BfNI
 ZsVBLSiXNHaEW0qKQbDQ1RDRjheuRryV+YO2A32HkDPg0BLqAJALkRrDKqc0zxcp
 c5pqGaQbfA/R6Tj0i1dXyJQRad68wEGl3+gQ7nfDFnHCdVp433x1v7+W+wBo9OG0
 XZDI6jYzybAUODwLmasBL69ZtihHTNZo+CLnxskO07pnp3n0ivIeJj2J28Z2GhUA
 DqchubnZe4UE1Bu+Fpz1XhfY/nLOIg9flNO/wlfVrvw1b+aS/a+iOhTxfkn1LguH
 7OguoA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auascr2kk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 04 Dec 2025 13:31:49 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-559ab9b8b24so17546e0c.2
 for <freedreno@lists.freedesktop.org>; Thu, 04 Dec 2025 05:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764855109; x=1765459909;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O8v9MZRcYSWOYsXns5st4tio4IBnhtTaYNkIBg1TWH8=;
 b=Pzw10jnXZ6Qm5HJHl3GHGcwk2wJBePvB2sxyRThA6jxcokPPq9vIBYR2uKSZGcnzUF
 GHLV4aGDbyGK0UABJH1ump7lschlXaTbJD5ltgcGBT/5huOCRPo/Ex5CXxGOkIFzeap5
 KZ4fsiO+ggx+AIsDLkqRjV5cJnRQB+KCEFNBRahq0WuLsrbTAco/D0Rqp8UY0zfOleUn
 iYK/MaxpFZsWksRh6gKt1tjGXei5OiLFttbG/NOnmOVVtST0VoNhVLxuBypl+Spouasq
 mvgL72eJ5Vs6g1aMnXuPvUZDckK0ISDFqXyd3OVDaY1uKxnuiclpX+XzKhVFenq0RF6F
 J26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764855109; x=1765459909;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O8v9MZRcYSWOYsXns5st4tio4IBnhtTaYNkIBg1TWH8=;
 b=fnqKnzNUMLUDhmvYyVOaFxYLbk0lEdR9CJFswG/XiweYfmWeeGH8M0ST2TMthBBiuH
 vrmpycEjdHgMiSf2JKg1dpvg8pvc7kKAlHuacCVs96Ort7OpLCr55h/KMU/Qr+0OpEqX
 4Ts1gApzZlAXbMhcnJCOnK0VfkxNPN1LsGHo9RWH3yzS6vUnCuwmJSKbAKqYgALf3VFk
 lVx1KdMxT39rQsrtFEyymuFuYDqDO3ipTFffDTOzpcjAQgBUMTeeRoSnlRLYF4IRVigm
 KA8PWyaYA4H/ZERU0ZHrlUFAwixb5e3N5kMZTU0SN+0uUKa1O+KuInezN+hF7Of77vYa
 14yA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUx9+1DRzGMTATaisfJdiXTSm5MiHyfNaKB+KmKs7B5hs3Y+BJeab8xARoyQcau1IqmwnBQcxfu9HA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4eh5jZ9eG3yUum+zHvuXyI1RO7sxYp26ZYJ3g67WOQ8mDsRKi
 MzYOlD6aw9uElCjHGHMhhdFyGf5hgzGKAbvPZ6GN26V350wzf6QlW32hkAcfjM6HouXlhGOz8RG
 UKMlwRHsHG4chTqF414SuTRiwvbxV6kypC5+axZ3PPeO+phhZDXLWIYdlJ7TOs+z6YUHXsZg=
X-Gm-Gg: ASbGncs0sMindbP9NVffrKZwTCxQqed/w6uZ1MHoF9tlnbwu24YNyiLv7+ubdex9BiL
 GmlDlsABzNtxh8b00tCqZ6+Z8RKanOD+uq5nuZ56zId8JeFlXoYseK6xOCDUSKZJuy8+bbMyZti
 r8yn8K3drRqIeI4KdZ0XoXnkEujHvT59JCbg4efoV404RZJjQv0YpQuZn66gP7+NE0RYzH6DYKA
 XwKQAwD/z/hjVkaSSemJHiJFQsMLDNZ+rk9frG/jLGOYk8x/9a12FRc05ALvMYRK3IsAPYkIUal
 rWHGfGfFzwrSf4z3PQusE7UOGiCY1vIhf5DD5apgxMLsa567Y0Tk4PzPdcX03lW6ZCSQj/Fyv4Z
 sV7GHJolVLoN3Jmdr+OH6uCY/DKcKXaW22I4FfYuQCS4FoYiQy5MRICyXCJOMsbIPiw==
X-Received: by 2002:a05:6102:304e:b0:5df:b52f:58ff with SMTP id
 ada2fe7eead31-5e48e379a6amr1243347137.5.1764855108998; 
 Thu, 04 Dec 2025 05:31:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFeaJsm6K/kvkrh1Lx6h/U5lKoBJw/CsJHPt4Who4H5sTNAg64kPQk7dL5ILDp+u1Q5usvJ4Q==
X-Received: by 2002:a05:6102:304e:b0:5df:b52f:58ff with SMTP id
 ada2fe7eead31-5e48e379a6amr1243321137.5.1764855108567; 
 Thu, 04 Dec 2025 05:31:48 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f4975c88sm127980466b.35.2025.12.04.05.31.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 05:31:47 -0800 (PST)
Message-ID: <9141e67d-2837-4e73-bd3a-9a9c5b8f72f9@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 14:31:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
 <8560ad26-4756-4c2a-97c3-2c5c0695172c@oss.qualcomm.com>
 <z4gqro2bx6oq2ht75m2klogo5dsirb74tmc3u3shjyalxmaxil@5sy7ufmqhdgw>
 <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cN1xvQ7UfYZ6m03GQYKVjX6wbZjGzujn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDExMCBTYWx0ZWRfX1UVh70VGfe0F
 si9WyV9u+BEs0aXfECYsCh07HHaYaSQKmKpkfU5Nvradp4USsJ0gMVOzex2QBoC6ceveybIFyU+
 o8sQXWYbfhFpoAy2lrwFDUERQwEaMPVpDEGK+yp/72LW3yUfl90q9fN4w+4C5QQsMFwjeJSf2rb
 4eRdaxoQ2SzSrCWvy4Gv7iqr5f+7fLGBki9IFxvZfEjYBH79RtVZzRyPv4imz3yZAv+xgvloWHG
 GfqlgYCYb8EcehY52E6jnawYPxUhffLhsU9PgoCPGjYNdt2vfQ7d+/uJig3Lsh1qBEMtAqlTcD8
 GUBOJ+zwxLroyeu7I1MIX/7qjb1dWyg3fPlTQlfLEeGvnpIzA8/onItvx7douf/6z2hUxHJZk0j
 b2OJPBiQZw3eqysiWzdrGERJ3qUC/w==
X-Proofpoint-ORIG-GUID: cN1xvQ7UfYZ6m03GQYKVjX6wbZjGzujn
X-Authority-Analysis: v=2.4 cv=b9q/I9Gx c=1 sm=1 tr=0 ts=69318d45 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=mMOXnzwY0fgUwPJIr_EA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040110
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

On 12/4/25 11:13 AM, Akhil P Oommen wrote:
> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>
>>>> Add gpu and rgmu nodes for qcs615 chipset.
>>>>
>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> +			gpu_opp_table: opp-table {
>>>> +				compatible = "operating-points-v2";
>>>> +
>>>> +				opp-845000000 {
>>>> +					opp-hz = /bits/ 64 <845000000>;
>>>> +					required-opps = <&rpmhpd_opp_turbo>;
>>>> +					opp-peak-kBps = <7050000>;
>>>> +				};
>>>
>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
>>> or mobile parts specifically?
>>
>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
>> here.
> 
> The IoT/Auto variants have a different frequency plan compared to the
> mobile variant. I reviewed the downstream code and this aligns with that
> except the 290Mhz corner. We can remove that one.
> 
> Here we are describing the IoT variant of Talos. So we can ignore the
> speedbins from the mobile variant until that is supported.

Writing this reply took probably only slightly less time than fixing
the issue.. I really see no point in kicking the can down the road

Konrad
