Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F0E9BB049
	for <lists+freedreno@lfdr.de>; Mon,  4 Nov 2024 10:53:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD22510E2AD;
	Mon,  4 Nov 2024 09:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LCiSwvcl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34EA10E2AD
 for <freedreno@lists.freedesktop.org>; Mon,  4 Nov 2024 09:53:56 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3NuThi029772
 for <freedreno@lists.freedesktop.org>; Mon, 4 Nov 2024 09:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 48BbhzMG6nJlrKXOIqS7msafjr/+9ztjQ+P//OS3fys=; b=LCiSwvcltpIsTr4J
 yevfNJVC/ZLqCrYRj0AKP/nrsvkIIrcChljyktNYe+TSomgSkFAXJP6H4PILuhcv
 HFxOtIcXnm08CXdeUD8+vJNNZozBIAY2Y9B+scea5HmYpDfGG9Nk3BkgN6jcghs0
 2wyy/cyl77dYrvYGGrW8ISDs1cXIsBzbv9N0awOBBL2V99Wgm2s7kPPe/fsOPhrC
 nYc0u+cUS8/XwI9LSK1X6E08wyIPjHDdAwwYlWrh/oQXwc+lCzma3cYPNVDBhhIN
 SqlcD9Avl/vqLSdVG0lGvlxpwbXThypxW7Ou2i9U28fGRYXjTKeITvPpoh26Zq65
 pZr4FA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd2r3nne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 04 Nov 2024 09:53:56 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6cbe993f230so14830826d6.3
 for <freedreno@lists.freedesktop.org>; Mon, 04 Nov 2024 01:53:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730714035; x=1731318835;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=48BbhzMG6nJlrKXOIqS7msafjr/+9ztjQ+P//OS3fys=;
 b=bMBe6JFGnaEmpoEOIN7XhIaoKUh92n6w4cDYiO8bP10JDz/VX8nK9Wcpl0Ks4737j/
 ASKkbN/NOc/eI9d8V9ADRCDRzbSgQwLIgR8hphpRRWDEJjNnWnrTHvtKLtHW9VPf6Olm
 6ynueqTjtptNS5l+QxaqM7D0Z5MCEyac1bIaCq0ZMuZ8+pXHII5HKIIjkm78pSCMFSc2
 glvhbBoUWKFkIVb4pnrLzZVAFnvaRL9iWYcz2rjcr6fsZ8SjUkegW5kmClKwZmf/W+Ug
 hjVrvHScr6IcKi0owksX2e7WbV8FxdnqlKt1th5SaufOk82Qe5K2amprD+ogyITm5Kvc
 T34Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVykWjr3oleWRik7SE9aYlYDWPwJz942tOu34xS4etbgCCTOIpTOKdvkkwGwXTZH8GpYARZUFm0SH8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxokJu7Sp16zVile1zN+fH/xGdOT/1HBpRwS3cKwX9xLinRo13+
 ZkdP57F519HzGxqP2UqJWc8HtY7d+/MyevOLIexvH91ayo0FawwjhXyTu9UV8hfGZckh7zqNvgD
 vJFWpUBekXsstXnNRKxLjXtuLHrysvZDiyMho9tHrAOsw+lKUkUpCndk7E9iX9BQAzio=
X-Received: by 2002:a05:620a:4443:b0:7b1:1313:cf42 with SMTP id
 af79cd13be357-7b193f73494mr2113114985a.14.1730714034906; 
 Mon, 04 Nov 2024 01:53:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtxe5uqc7MvnqsqyGo/b1+j/YoMPpCIwglJ2JELVbc+hCFY6xRwAJFk2Rx8PoXnp6hGWQDww==
X-Received: by 2002:a05:620a:4443:b0:7b1:1313:cf42 with SMTP id
 af79cd13be357-7b193f73494mr2113113585a.14.1730714034624; 
 Mon, 04 Nov 2024 01:53:54 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e564940basm538280066b.17.2024.11.04.01.53.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 01:53:54 -0800 (PST)
Message-ID: <07c5dbf2-8ce7-42fa-a511-3dc22f525325@oss.qualcomm.com>
Date: Mon, 4 Nov 2024 10:53:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Check return value of of_dma_configure()
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241104090738.529848-1-sui.jingfeng@linux.dev>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241104090738.529848-1-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XpUxrnGiC_vHDERraE2N2r0NAyYBPOTs
X-Proofpoint-GUID: XpUxrnGiC_vHDERraE2N2r0NAyYBPOTs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=976 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040087
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

On 4.11.2024 10:07 AM, Sui Jingfeng wrote:
> Because the of_dma_configure() will returns '-EPROBE_DEFER' if the probe
> procedure of the specific platform IOMMU driver is not finished yet. It
> can also return other error code for various reasons.
> 
> Stop pretending that it will always suceess, quit if it fail.
> 
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
