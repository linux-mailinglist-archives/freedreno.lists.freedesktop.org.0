Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B79D3A904
	for <lists+freedreno@lfdr.de>; Mon, 19 Jan 2026 13:36:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37B410E430;
	Mon, 19 Jan 2026 12:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XHpOwIqJ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iPoz86pn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A16510E430
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 12:36:06 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60JBDSso1440933
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 12:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=VhQ9FwvnxIg0wpGZTU5qCD1v
 PmdBF3EPcDNMD3vgPxE=; b=XHpOwIqJheGqAm8NOKeKY8j4xkPE1BM5IXdioLf0
 MSKjqINKvpnr6LpJdFp7tZiuKUxEql3d74kreqYj5+KnaguYTjaVjf5v+5sFD39W
 anKH707SQ36fs28Lfozac6BrA8gNbPdqOA/pcuJ9mtTa4Ss+pCq+NFquBUl6rO15
 1jEMIa/u1FMZFw95VgTSSG+1kxTHL+y64qSfOAZjve1x0o8W2m/lGlSP41hMZ7RV
 N0XYi2UjmwEUIZlCahSxBOPc+7E3NEC5ADCcWC+abcsyeNVyAV2c+wu1pjpZ2B3P
 03+DDKKSQlgp53fV9a7L01tn5qqg5HjTiLYnWDIuBqRn1w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bskj3g70h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 12:36:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c6b20137a6so493501285a.3
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 04:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768826165; x=1769430965;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VhQ9FwvnxIg0wpGZTU5qCD1vPmdBF3EPcDNMD3vgPxE=;
 b=iPoz86pn+4dUC7ep3Ukid9auG/PMhXmFtjYgGY9+SGZuEMY3t8RD1+bwGWIYAI3ema
 SnZvqq13TgISqSJQwr/OGEkF4MM3bgzRLNKKwrBGWfxYlbt+JX5kZQY06EKVrAJr6bRi
 zlQMCIPlNsHqCi9a9H9/EdZMOcpRlcwbMf6pDUMqbL3bQfYI+eb9tShF2iLlEotSdjWy
 mMIz59bl3vAa3HFNIm3N3hxiK0zy9QThGdJSYPQ1Nk2qLt8zXdkxQQxCSYiRNy5k2a06
 uWw4+nl83MRA8aeNdm9Wb/oTRFFhoBG5Oa4oK0LNZCMOBER2p3j0jW4js3rqFr8gXVbA
 4Y8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768826165; x=1769430965;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VhQ9FwvnxIg0wpGZTU5qCD1vPmdBF3EPcDNMD3vgPxE=;
 b=MdV8aTKf8lfFpgN1iA0QKVF0/IwfdRr83ykssp6xaVl5OdM+E2fyluGNzOc4B+oWQZ
 vc+t6eHmVrkvM5Uwd9TRfWuww7Tijpa6TI4fJfeMN/15T6D5pV0CQZYs70zPBFmGVMmn
 4+Xd4JH20wGnOVBZHNNSebFjU5k0eRSDoiQWkYLt8Oi3HYHXNQ+QAKVu+vT/uzFSHkCq
 9WN9PU69T9r73rRJ1QPY+MzoBtLqa8RuZIrw9iz3ytyydyK0GSTxkmdNy8FDOujWdQ3M
 UQQl9H+xaNHm2rJvqXslVpyZnkbrk/+qEjra83L7K9ibTQxGVyMp9tEbDwoeuluJthSO
 HPHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCNp8JYgZKhAVXmmetODIVEiurpoLWzu939VF7mwuTDhQIGDBbkwbAJ8yIpsWwJBmqtkXigRba0hg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkagrYwcLCvI3DHXbzVscqaSqz6aDxcy7WG9jQVJ8T5DT/XWqF
 RGVG0WErddaeI7FQOxF5uYAdR8hqmMTK/r5AspjWA3o4wxCy9O7OWCUtXRqflB+RvqxsgMu6umy
 DRL9Wh89x1JHcHO/oYmEVb/8/ZW4/9dV48Rh3EVz54B1BAKOZ5krJ2GK6Lm6JZx3+T7b60Uk=
X-Gm-Gg: AY/fxX7iEbWeyDdiMVs9VHrwX2zDtJ9tW6It/Gw8RmQPADCeEvu61qB1Zitb4kdmEB0
 A2O0L+WUfTVtgkJdnREdPx9fnCVawMnJp1R7CaNQrhYPRBtOaMEwrjRZ48JPiiOraOI3JpeG0zI
 tb6oPgbQX0ocyQNzB+Ip/1ARBlofME/6EdYOSXrQEtFugwTadK6wWH875+kTyZIuLIlSwkquwKd
 M8aut96ghzigL4CrqVWQXr3MUhl9ukhhzN18doHrOXI1Tr5kvzzC45n9U0u7Rj0lpJtC4SpVOEL
 yXnGAVXCOGnKAnwjT5hPhmkivJ91zzTUbsnQ+E3j0ghtaEcTD2jcCTAaCugG64hco0Ek2hHp87A
 aUV21a0cTQYgW3ABBZz1w2yUaMReVLeYoC3oAFKWjIdqmY4lW0qfKkMUK08Q2e/1YTTHIf3j+3C
 s+KVkXqBVO2cnOR9SeiTEvoTM=
X-Received: by 2002:a05:620a:1a94:b0:8b2:e1d7:ca6a with SMTP id
 af79cd13be357-8c6a6783edfmr1413786385a.75.1768826164965; 
 Mon, 19 Jan 2026 04:36:04 -0800 (PST)
X-Received: by 2002:a05:620a:1a94:b0:8b2:e1d7:ca6a with SMTP id
 af79cd13be357-8c6a6783edfmr1413782085a.75.1768826164356; 
 Mon, 19 Jan 2026 04:36:04 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf1fdc3bsm3281058e87.0.2026.01.19.04.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 04:36:03 -0800 (PST)
Date: Mon, 19 Jan 2026 14:36:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH v6 00/12] drm/msm: Add support for Kaanapali
Message-ID: <433cwpqtfzo54ls3ivcahu4fntizgqrdqqi4xgjtbtv3lskpib@dwn7kyshvels>
References: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ds7Wylg4 c=1 sm=1 tr=0 ts=696e2536 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1Zs5HNVOiqO5ZMFY7eAA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwNCBTYWx0ZWRfX+YYNz2BurjpA
 jHq+DadIhXEoeN7678gAPyelPvZntDOYgDUJlDDBH0zLFcm956DWXKIjy2WyqOz2KXdQ0D794zX
 QsPLRer2K4O5PAztBiRFI51h/BoYg0MYwDXIv7mBtuO8+mhPI2ugnLt3EjlpVeTJWuaJkGzP1KT
 aaVTPVAuQOzUX16tV8YJ6iqyD2uXDaGy3cqap20ArzCuO75L3meH7xLgtLaKdyY9Ut1B8GFIQl4
 hrIUqc/F0qw3zQIThE8O8COs4CGlflxHZLn57ZWZvvJqzcsgS0IOMyNMeORtNneSWfX3hrhtL2o
 ibw+Sp7SmA2IKbZ0+GZdJWeN6YtjMZAf7SMsFG6X0yGTr4sqG+BJRKE6mS1JdxWvR2NDrH0cm76
 5bLx3dzR38j22zDoXewgK7UlpoeRyMxox7yv5AvgbSqWOHyHj6KyRgBO+GDEwavOn0g+wMlQsrY
 yymWjJl5gDvjpRt55QQ==
X-Proofpoint-ORIG-GUID: t9QCoQKNWH6uFFCFC4tezQXdv6wtNMQn
X-Proofpoint-GUID: t9QCoQKNWH6uFFCFC4tezQXdv6wtNMQn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190104
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

On Thu, Jan 15, 2026 at 05:27:37PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> The Kaanapali MDSS has some differences compared to the SM8750 MDSS:
> - DSI PHY/DSI base address have some changes.
> - DPU 13.0:
>   - SSPP layout has a great change.
>   - interrupt INTF layout has some changes.
> 
> This patchset contains DSI PHY, DSI Controller, DPU & MDSS bindings
> in addition to the driver changes.
> 
> We have already tested the display functionality using the Kaanapali-mtp
> device on the Kaanapali branch of kernel-qcom repository.
> Test command: "modetest -r -v"
> kernel-qcom repository: https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/kaanapali
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Please rebase on top of https://lore.kernel.org/dri-devel/20260119-msm-ubwc-fixes-v4-0-0987acc0427f@oss.qualcomm.com/

-- 
With best wishes
Dmitry
