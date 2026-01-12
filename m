Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D065DD12233
	for <lists+freedreno@lfdr.de>; Mon, 12 Jan 2026 12:03:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D9910E0DE;
	Mon, 12 Jan 2026 11:03:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="U8PqZPCn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fN1JAeNX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD54410E0DE
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 11:03:37 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60C834iX083949
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 11:03:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LWBS851Ia9wsg6R1V+UQBXWOrP4n0IYlCQF4mRhDCyI=; b=U8PqZPCnoYQtxf2y
 hLIzEGgTUpIZM14KIwdecISIcaTggrWPUAN625slcXr4PqCxf5PNL/LHZfvYjfy5
 NJAdb0AhdpFoSol8V+83MyABuqnayrBAgkLnxw6oUAnFVV0srYljUoN/ebOrJrQV
 EzJJyZikPnXUKaRn7LFbUmnQFTBrBvotwtQEEon+Uaumy8CGCu9cMHyftutpREFc
 RZh/dCixsrM4SJzlMdO6KRfKZpZO6f5QwTsEhXUEHU1kyHXDz7jvYTwi5xS5CBe8
 oUX4RPTdky3Hx21IjVtBllg8jdMDs4K7aqxbnjq+3zC0GvvvcZT+F136ZYhf2OU7
 r01RLA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bm8kytq6u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 11:03:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b2de66a28eso186659585a.2
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 03:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768215816; x=1768820616;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LWBS851Ia9wsg6R1V+UQBXWOrP4n0IYlCQF4mRhDCyI=;
 b=fN1JAeNX3mVYv3GqWTkJSQH6lTLTQNQoIJRx0cF4YwGB1l+cZaniu+2j7ILG1fKgLx
 oudDqIxKLhZBoG24eFTR7NSVJtIHgzzqkv8uD+e9L/MBAvXQoAlBeZ2ofbysYGdE4uW+
 wA+nlz5imUnD4mtC0l8nuZSVYewMhzX/Yf6CW7f5urQxCvuQVBdjWknlufQ+Uf8jVC/h
 DDrf75LZsBdiveQzBIzI794EiCuZzniktIwuXl/bPx/3IaqnfZLFt8zQ3OP8ZrQtw+sj
 Zr3W3IjTzRpEBtRjXyw53+vhWQ26xyphKj1nzZ63e1HwOidkja4pomE8UutC/wEy/yXp
 giaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768215816; x=1768820616;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LWBS851Ia9wsg6R1V+UQBXWOrP4n0IYlCQF4mRhDCyI=;
 b=lsTYH9rfjVYDCXLME5j495wgs/g8l2HHjkQb/d7IU1l4pkmjessf9NJlUy9eh8VUQN
 zIpqwMLcWgP7RFlnwrMDqtGGyd4qNZHc8ZKdEQFtBTY36P/jHwOHk+tIAM+GyOYkG1hl
 uJeUnsazyJVImXYjQ+xbtdL5F30NaKtIpOTJ7SqkPlp1U8o/hcwjjXSuC0QbE4rnLFqf
 6c94S4Pj2guthRs9nha+QdLK7MefuYN1AbscShVN9D0sCmo+fkUxNKj0IVhlJMCuyDYy
 85OSBM6s/w3Hu5lG3O20/KZ85XYlBFWAs+cAx8c6IR+6FVAElv7FrNicVvLsFDNJsxYp
 Nd9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXw0pXZ6cfrREkCtVJeToeLxDrj+tpjel7Vz14ooYtX6aHh4MPzZCr3e/f458Aen78kfmCOQozV4s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEzIwDPVkphRcRrox8UEPF5OW4sVg738Cmnf72nF8M1vsc7xbp
 yHy4/gaPt3TcsqAEiC/UDqaR0Bu6A2PHP+naaneUwi2JL5Gk+cZ6y/wYjgvLeESSPSWKYYv4Pxg
 Rk57+T62f9ITJ1JYakrllY/Jnzp18/9ahYAnTxnslkZ0uGdm1lxPblT2Jn59TCUIX4giUFU0=
X-Gm-Gg: AY/fxX5MP3XW5HW4wOwGXSZGPFodxhhEZRM1A88jqbIeEnK7wbFTmJHiPOta5FV/0zx
 imhVeH3h9P2ZTys3lc8L5ItxkfshvcCceKj1QTZItM+9TYs8LtSyAAEj2ZTcqYiJrnSV1/D3NNd
 diCsrne/OF/cQldFIgQikCF4qPVh3Tzx9FXoQ4JlU3qGw+p/aU0wrtY4VmxApK/FPuezwv7fcGc
 VuOxxyiaSVjIB478mNYI2l/ojtJGAXBcqizFLSSlW6J+p3Hk4KcVrT3BtZqTfLn4VSoXchxPNoJ
 G+WQxvg1fjaDyaTu24ok5pnERV5Jlifip1lcmSf15IrtX0syvjTLfIqbB72F/vZhGidBJ61i2Cm
 /r2ypzyc3WKRAEs5tL50zoAN5lcaI64o38o9vjtu24duuwbVDhB3vXX9unxIysBPNwfU=
X-Received: by 2002:a05:620a:1723:b0:89f:5a1b:1ec9 with SMTP id
 af79cd13be357-8c389365bfemr1829828985a.1.1768215816241; 
 Mon, 12 Jan 2026 03:03:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHl0UVgSxwCS98Z+ig6bZpztO1J9kTdmMnC/XwdizBlsBUoDqYEdx77+tSRUDHZhCuXlzH3vQ==
X-Received: by 2002:a05:620a:1723:b0:89f:5a1b:1ec9 with SMTP id
 af79cd13be357-8c389365bfemr1829824185a.1.1768215815664; 
 Mon, 12 Jan 2026 03:03:35 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a56962esm1921632266b.66.2026.01.12.03.03.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 03:03:34 -0800 (PST)
Message-ID: <29d2b989-2040-45b8-97ef-58fbbd1d15da@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:03:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] media: iris: don't specify bank_spreading in the
 source code
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <20260110-iris-ubwc-v1-7-dd70494dcd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-7-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NLQb8_wju-27xmyM7mr-1qepxn0HHset
X-Authority-Analysis: v=2.4 cv=ZuDg6t7G c=1 sm=1 tr=0 ts=6964d508 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ss-qTuU1ZYQsC6pQTdcA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: NLQb8_wju-27xmyM7mr-1qepxn0HHset
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NyBTYWx0ZWRfX6b7a7Whst7lV
 EOwmZg10eiP7iZEWkJ9vcpWZBXoHOQUQsm5ANUvHPKSI/bEXmN5FXX9HRvN6Zs2O5b0soQU3aY4
 d2URNM9lgVTcZSreeRGBlaukOnH37o0BS78UKngnUrOVK0iHYEIklLa5pde84cBS0IZ20YIMNnQ
 UvYagxCIRCOBsmq/OpOVIdj5LOtNP0mEZDKonCV99P51UsknOopbugmSEVer/cCq6xO5lXACLV6
 SPX+4PWiNnY49hhazvTx9sd/cppMMXqrIodQ2a8A62mI63dsVaxemd92oo76xI25lWj+fPERGcr
 FpI/XcuhRoIXHICgE5cLog7WBLGKGy1MXzKiqPFr9YNkAcCP4Hw/SWduFrzwNl3YSgsHaBWHkQY
 tkYueMXFeEJMRKyEIb5GHC5tNGGdVTrPLz8SIstppySf8PPxcwCt2m+v1lgB47u9sKMZEVjh1DS
 KoBEF0Jo4566kYp2CkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120087
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

On 1/10/26 8:37 PM, Dmitry Baryshkov wrote:
> The UBWC bank spreading is specified both in the Iris driver and in the
> platform UBWC config. Use the platform UBWC configuration instead of
> specifying it directly in the source.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

