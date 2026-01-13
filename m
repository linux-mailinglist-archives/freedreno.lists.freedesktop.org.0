Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DEED199B6
	for <lists+freedreno@lfdr.de>; Tue, 13 Jan 2026 15:50:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9C610E4E9;
	Tue, 13 Jan 2026 14:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vzqcb2dt";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OkRIVqN9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40C110E4E7
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 14:50:11 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DDsQ7v2071004
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 14:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QcwxICmrR4gn1iEbkWO2XmXQzG34ygAOuMpV2HL6dSc=; b=Vzqcb2dt4qxwuj3n
 3tbwEq+TxmsomftMbdaJKB2dWG02cGZQ0B081IHQSeqUVPmXQjcZDZc6D254Acte
 II3d9yzPRmlkewFJLrY4w1CTuMTq75jwimIiyunT7t4D3RmQAwjkgh0asG+N1GWU
 7ecJ+Jvvmox+4AqJmqFXDUPK8jFO/MEyoZtBA9hnGc+yPcWdmotPRWiaQ3tsDZK9
 1ELHWZaOu9wXq2ITxn7pTZwfCDGTin829GIYqwNA1fpV3nzMvqlO5hSTZtpNFoDF
 qCqWP3P2dNIpfl1Fdg+RnsCfpSWhiWku84zBJ4EL/rnfWgB3uV3mZmU+Zapc+z0L
 IJorww==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnqbm85wr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 14:50:11 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id
 956f58d0204a3-6446cbc11a4so2774505d50.3
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 06:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768315810; x=1768920610;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QcwxICmrR4gn1iEbkWO2XmXQzG34ygAOuMpV2HL6dSc=;
 b=OkRIVqN9cRuW19CPFHeotxUtws8EMSJYXUE0zJDueUAM0LwZ63gAoNIl4AHZKCN9AA
 sTGwF/EfZlK5QpcPM539yONTNsc26YoW7RZuaV1XT3PZx92LfjODzButCovLaiOwjtk4
 UZOnqvnYyjAyoWB/IecM5cdVW6vZaaK2pYtbj4zDAbY8W1yNDX3PtQM7ND8tmSb0n17a
 1rYWF9rfPppRd2CihOBDlos0mMczifgr50XBLLoMK66DNb/6o+PkWo8RAblAQW+dRxQX
 Lt/ZNZLF4yyacH1+MuPO/TgOT7UjonWV+mDVUv45EEyrHD1SFCPEyZbF4+QUnomU83AC
 O/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768315810; x=1768920610;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QcwxICmrR4gn1iEbkWO2XmXQzG34ygAOuMpV2HL6dSc=;
 b=rdW952ms2sKY/D+IoUJWFLeYItqfignE1dOpHrh9iwlw1+LohSSi04nGKbofiuS/Fk
 K05t95J1D3TUf+3/jfw5IuF9wvcGvbADshVNZJX+cOuVO0N+33cBVLFs2b/tmWHHnYAl
 eyaBmgD/44Qhac6+P5gbUs01B3F3h18yQAUqwLdftJXltrtn4lhm8rFwPBEuxHws50rs
 PrJCd18B/hk48pmFa5U+G9vx40Z2B0GIaQRt9aYAg1RVJGL8q3j4O95FMgiUyx8R4Dqv
 ErVhhYWxYIcaml0qXzefuR/Dr/Rn8I+yS9MgqBe9M0CMQCshKWz2UXx1tnWujwd6XvJe
 lMaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXq1d5mWbwiwOcUH3dNjUKvL9ardU+yx0Op0zdBLY9zCCIT3CRvRIAU629zRJ1xmrRMDviCFYPiL1U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJnZGelHTJ4trerEoVYhY169AShn92zToDECMETHgtbfOtbar0
 9C4gkZMqoUnrWtbageFi+0ONoH1lbDjLgBqfjwo4q57UXT9mzkTeQpYMAhnJqdLF3a66iRlQSoi
 FVhDgjGKfls7awqHYFoDncQsM7jlsDZLZ84fkegzrSpSsy9bkVOufwBWz0AaOzuIx6/4ZSBE=
X-Gm-Gg: AY/fxX6zwkVqU09NoYAIz7wszQQ9Naekn8aqznsNdwgX+NrqNIvzJnz5V/T5Mpj0GFH
 swn904LrhkYQxWlsdP3GS5DfOBgvNU6TFwfLoKI3QeghDhdXaea0gho+K0e4OvrNet2ZNBYGF+T
 5d2kbp1b/diT5z+0xbZVCwaAnV+Ma+CXa/rF2BE05FNXKY/L11JNj0I99rc3SfuIS7GKHmYYs1u
 a9ZNkg8t5gTUbo2gf5VXXpy7JGUAgKRRUfioZe/4rtn+wZu7IMXzV7W7fGhvp3osOSjWwYFoCZV
 C952X5WAiv/JKwCmeCZq5nJCnqVX5nGjDQ5M/7rzxB92YznBRO1qxIMrP1w/i4et7rtvHyejv+k
 M7k/2biZtTdgLIq9GoDGJmMJOXNVfLYIwQPCYNgtU0SeG/0YCdr/lxrLfEeLbFkR6EfI=
X-Received: by 2002:a05:690c:91:b0:78f:c0f3:2e10 with SMTP id
 00721157ae682-790b5701642mr160364817b3.9.1768315810534; 
 Tue, 13 Jan 2026 06:50:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHp1gIBS5jEoXkt1plSH+bt7nf2F4KHwCWqllM1mxQRTlOiQ2zlHM62mWIaorCJLX3SUhEhcg==
X-Received: by 2002:a05:690c:91:b0:78f:c0f3:2e10 with SMTP id
 00721157ae682-790b5701642mr160364427b3.9.1768315810084; 
 Tue, 13 Jan 2026 06:50:10 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b86fc303d7esm1058489866b.2.2026.01.13.06.50.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 06:50:09 -0800 (PST)
Message-ID: <d63d4c98-68f1-4dcb-b8fb-7c5daf343cc2@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 15:50:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: dispcc-sdm845: Enable parents for pixel
 clocks
To: Val Packett <val@packett.cool>, petr.hodina@protonmail.com,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, David Heidelberg <david@ixit.cz>,
 Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260107-stability-discussion-v2-1-ef7717b435ff@protonmail.com>
 <702e4696-5ff6-4c72-bce4-1a9a8ee1ba18@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <702e4696-5ff6-4c72-bce4-1a9a8ee1ba18@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tVXm80h7sQQAjm56KeYhDxplhYTtYsxX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyNCBTYWx0ZWRfX2ivj0Yt47R+w
 utvDvG597Jfg2HKGnNFJKIH5lx9wpxGlQC/tKb009lch8iNihRenS4o5CkS45BXnMRjc6XfetmJ
 1x7UuTL8eaBkPo7FZuHS+4yq2EalvyGhvR8kyR92a/SEa5sHX+u1GM99Wf5fU5XRZ5ivHxDc/vO
 AuU0IlL+D7kqEwrDt1G7nBRngtQL5cKjZ/3ynGmL0nsIO9gn89OFkZq7JguzYy6/unOSF0nCEUK
 u1K8PfKv2um2qnsq7wIPa5PNGhjM2l0rkaLf1S+tom/vY2spG2WSe0oGb8ixrxAeuA2VoxLXJwf
 Qw3aPzeMLebU+LYJt1r39xYuVqBDOpFzCAZNQ2Ui4jWhKwzjsLM62Jpbn5xjtjU3HZSOmHEozH9
 GaJpPU1gC1+JAEC/PE7EtBuhcDyaHhE8JfbzTVTn0KfMLPCXLlBQEm1cNTPls6uTJf1iRVxaMOz
 glykVZLDVqmk102oakg==
X-Proofpoint-ORIG-GUID: tVXm80h7sQQAjm56KeYhDxplhYTtYsxX
X-Authority-Analysis: v=2.4 cv=YdmwJgRf c=1 sm=1 tr=0 ts=69665ba3 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=sfOm8-O8AAAA:8 a=rC8bUFBNB4MWVkYa7ykA:9
 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130124
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

On 1/9/26 12:00 AM, Val Packett wrote:
> 
> On 1/7/26 8:44 AM, Petr Hodina via B4 Relay wrote:
>> From: Petr Hodina <petr.hodina@protonmail.com>
>>
>> Add CLK_OPS_PARENT_ENABLE to MDSS pixel clock sources to ensure parent
>> clocks are enabled during clock operations, preventing potential
>> stability issues during display configuration.
>>
>> Fixes: 81351776c9fb ("clk: qcom: Add display clock controller driver for SDM845")
>> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
>> ---
>> We are currently running the latest linux-next snapshots (next-202511*
>> and next-202512*) and have encountered random freezes and crashes on the
>> Pixel 3, as well as crash dumps on the OnePlus 6 and 6T.
>>
>> This commit fixes the stability issue. I've checked other SDM dispcc
>> files and they also contain this configuration.
> 
> Hm, we don't have this flag set in dispcc-x1e80100.c either!
> 
> The only random freeze we have on that platform seems related to PCIe ASPM with NVMe drives, but during display configuration.. *extremely* rarely, but the eDP display output can get stuck on a blue screen. Many run with clk_ignore_unused for the early uefi framebuffer though.

Your device doesn't have a DSI-attached display

The Linux clock controller representation of the DSI PHY implements
an actually meaningful set of operations that (un)gate the clock

Both DP and eDP PHYs just provide funny fixed clocks to make the clock
tree resonable and filter allowed rates

Konrad
