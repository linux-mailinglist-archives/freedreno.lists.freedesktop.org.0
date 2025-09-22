Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DAAB90664
	for <lists+freedreno@lfdr.de>; Mon, 22 Sep 2025 13:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB33C10E447;
	Mon, 22 Sep 2025 11:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RFl7+RoV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96EB10E447
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 11:33:46 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M8UfOu006935
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 11:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8ny3tRDGyVpQC4SF6j/gk9PZ+S1uMs0oLN9O/oVrvh8=; b=RFl7+RoVThr85vGk
 0pq84J2kUfPoEE3WsNh6VQcoF4kb8m2Z72K5ej3yZCzlaicskMi9BVCeN+AUwxt1
 maMW7IHkViPYAXSrvKlt3G8y8eswCIT5/+Jhvi+08bQoJtAQB3J1K7tsLcBnlO/r
 uO0dEFeC5s05UDFPUQl/QxFe1XN1psGPHiCo0fcYOAOUaItSHLkOoiQoXfJKQ7f/
 0QZGJhEANzPFktT2Ik7fCZUzgYdl+kQHmjf8S86CC08zyN9bfehARY4q/WVGU6Mm
 YAh024zFm/pDMktZtYjzHzxCTDk7uoSkG2NVvroSVEqb1M0ypux5ePtG+JYMyCC2
 dukhcQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kkhmmdp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 11:33:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-26b3e727467so9454545ad.0
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 04:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758540824; x=1759145624;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8ny3tRDGyVpQC4SF6j/gk9PZ+S1uMs0oLN9O/oVrvh8=;
 b=vj3WZMzPM1ixq5RPpiPSpGhTZ5rSnAmfuzLHpRHjU6hTyJAgiDpMAb4eTrflkxP2Og
 MbTuHao1UpJq56FRINzX29C9QfV2hzERrTPeMxkANiyQNCSTCPrPG8UujlmzD1DGEjhL
 wbMy6R4RI2uBnv2vRg7XhD0NGVdI0zdHbZ99oaq6qjNGBUP6HPrwaJdIYyaj5KfBnnF7
 iThBTAxjR2udZtDe/jCj8eHOtMF/y0NrY64ItH4bdFJudymi2TKhN9db/H/oy6RBwQ0q
 gWLvbZxnU4IL97G5+AhfKqRg1XH89USQV8jIrGs7FX+Z6WOH762gZ9i4IWAB0dFKvGGp
 i+bA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUobY1aFOybC3xvUTHu8N6iCWMd8vOHXazN3ibD1/Tus6WRziRRz9SC8/WKuXjTyKbT3Lh6W+Q7DKc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz093nx/ffKOGInXag2fztnp804CztP6IPNOxdF/ESY5RuAepX2
 aSh6Jqr6i7Q4yC+QKmyAwIgLOcHX5i4wTvNScyG//DaXwPAbyq7B3XtrTlNX1iMnmBMHPysahbN
 NCBJSJv1SsuRsfrjr1fbC1i1y1J8/W/TP2SMcoY9ec8K6MkOdHLvWAIF5ML5hHEM7lN0WQWE=
X-Gm-Gg: ASbGncv2EMUaWdULTqo28WTPLQfPHoYD02LbQcwE2aZNazybpcPc2hZgVKPbvODKHe+
 T+nC/SQTHPM3bmJvz1Qq9iP+6YXZYlpG6mu+O03Cc9CB9w2wmK3sFO7C4zWeDab1vmW6FPr1Y6u
 1XD8aAwHpiPh2kROS8orOIkBSW3JwjizeEtwnnMAaDC0ANEdRMPDxFrcISuvZx37XY7nooEjE/K
 jBo3eMjJTbqHXDdjRJZ+mTXyl7/0C4zT0bBlBEFLimQUSijTy/XZ6TKDHdE11ClwjQ7KPTyuuGr
 D4yiUGWXlqK0d0MyP1oNXzS3jkO4J0LYHdgMYgBEd/6Qn2LvtDsUSNR64Gagg7GenR5dPBkriI+
 FMgXqWZdihHTDFe0UFQlWOw3c2nz8qnqv7YI=
X-Received: by 2002:a17:903:110c:b0:266:914a:2e7a with SMTP id
 d9443c01a7336-269ba50450bmr97852965ad.6.1758540824164; 
 Mon, 22 Sep 2025 04:33:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDHH9Jnyu/wz0+fPUoAUMxFXs1lC0P7l4A/wqHWPTtDgp9+q8Jyik+xPio2B0P/RaEWdFbmg==
X-Received: by 2002:a17:903:110c:b0:266:914a:2e7a with SMTP id
 d9443c01a7336-269ba50450bmr97852675ad.6.1758540823742; 
 Mon, 22 Sep 2025 04:33:43 -0700 (PDT)
Received: from [10.133.33.111] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33060828031sm13050240a91.26.2025.09.22.04.33.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Sep 2025 04:33:43 -0700 (PDT)
Message-ID: <f53fd974-f3a9-4efa-8cca-ff639d75196f@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 19:33:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/14] phy: qcom: qmp-usbc: Move USB-only init to
 usb_power_on
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-7-eae6681f4002@oss.qualcomm.com>
 <zjegjucwluzzh2x56mn7dpk4ocmbdrhyvubkxprpiuko5cifvv@ygvbal3vpssv>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <zjegjucwluzzh2x56mn7dpk4ocmbdrhyvubkxprpiuko5cifvv@ygvbal3vpssv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: E-XZOD8zE2KVwoVcYbOldIMrxvZP8r2s
X-Proofpoint-GUID: E-XZOD8zE2KVwoVcYbOldIMrxvZP8r2s
X-Authority-Analysis: v=2.4 cv=JMo7s9Kb c=1 sm=1 tr=0 ts=68d13419 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=MW-FMpQjATtQXXRqn1QA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyMiBTYWx0ZWRfX3qVN+NbBUSsb
 1A/IKhtt4li2/xv+ypCzKLjMGbHs0oyyu/iRsbIuIuQ5yf7lFmk1IviNGPmF24fNRmjy8fMEF0O
 sY799KksyyICwnzsj2Ue7As7dwuIj97fh4pGX8lSM0ArjsD9jFyhTFOn2T5MegEO+oQRIGbZ5RO
 ZYqN5UGv6t1QDnx8YtHmDaxl++AsH4B3O+i0NhDqNOPtohIjplByvH7ucK0GEVEJV0Bme4386/R
 V+h4LCyCcFWF3/kJXpfSj2FDVi4RJA5aTXSNGko/9tStibPzgupnn2uN6MpEBq7SYuspZ+i8525
 bXHF7X1H/AevhNpovEAeUOFPOwF8t+S3gwxbTaI/i8NpxthXxFIOXUrjYniDCLCa1Ngt51MN6bw
 Yx6+sIWF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200022
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


On 9/20/2025 2:48 AM, Dmitry Baryshkov wrote:
> On Fri, Sep 19, 2025 at 10:24:24PM +0800, Xiangxu Yin wrote:
>> Move USB-only register setup from com_init to qmp_usbc_usb_power_on,
>> so it runs only for USB mode.
>
> Please rewrite the commit message to start from the problem description.
>
> With that fixed:
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>

Ack.


>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 22 ++++++++++------------
>>  1 file changed, 10 insertions(+), 12 deletions(-)
>>
