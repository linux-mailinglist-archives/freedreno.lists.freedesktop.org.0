Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0151D19E8B
	for <lists+freedreno@lfdr.de>; Tue, 13 Jan 2026 16:32:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C2410E504;
	Tue, 13 Jan 2026 15:32:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TXl9sfUM";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jndGCD4b";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F20410E4F6
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 15:32:07 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DDH7vC3868700
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 15:32:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ccl5y1POfshQ1u62vw6ufJB9tUYIx6XdcUcwQWB6apQ=; b=TXl9sfUMemknR8Mb
 76dTHbqO9lU1cgVVu25AZBNFAbO8f29gSh/HSGavmO6E0Q0Rch91BuzQZsgedaac
 vMghU0Nj4JHCnjyJj/rnMYLr6FDzRdvMSfW2YqPTpIYYnrxqwJrWNv0iMrarGHyk
 vUrMKq42wnUMobiK4oNaBFsu7zptDat6068H1YHfNuAo3BUm11WIcFJgJmEJxlbM
 a1hvcOBHqJBclj+OB6BxxwawEB4gQJEaN3UtS6uRvOxvJafc/eP7spLP20DG9VoG
 zEUIdTWtuyTuDhtm22YskqAjLFLxcXQ5PQQCjd8dUtKZ8sB2hwopcVG/1wG1ZACE
 46ytWA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfxk9tr4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 15:32:06 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-5ed07bdcefbso208712137.3
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 07:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768318325; x=1768923125;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ccl5y1POfshQ1u62vw6ufJB9tUYIx6XdcUcwQWB6apQ=;
 b=jndGCD4bczr7c37i47DrpF5r2vICDzC4SsT/08/gtzs+5QRbBn4sMPaBNDmBg03T7H
 ygduTM/ItymRhHAl9RNKQbKerqTYtwVbmXsyu6hW7VT/KEB06Ee1+6qWWBFttl7KG4n2
 yuo7d6We99qV5thz/6dzerTYXQEU35VavXpHXYIK6Tz5FWyt2KiZaWzcp2Hp/NYTW5cE
 MMlHLcv9hwEcratlq4Q7OudVQrGkWC9El27ADm1KID7gQQVZX1L0ypwXAg3unJJ2lxbF
 H6WapAcW1cLj26yoXQ0vVDuJJz9Cni1Vvk3V+ShJ0KpuSkXfmeqalD6PYJZXnKYY2Yiq
 DmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768318325; x=1768923125;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ccl5y1POfshQ1u62vw6ufJB9tUYIx6XdcUcwQWB6apQ=;
 b=aWfb/MKfuYS1F4bSR3Ka9haO8ayiDge4PuPHa9XUoRe/BWrUJXNmxK2plLhpwYMB3Y
 qeFHfCu++dlXW7LBNFruGJhGGLC3ZaajF6rj6hQTjdZLfO23p4kTWvIQo072FL82DHai
 TZ6ZA6+KcdNsOY1XQFHB0fXdT+seUUjHAYj/+JLDP6ShhOSaBe0LaoLCCNN9cUCL89y2
 s/yqXm1gNOaYpVSUiJj6foFfW7B38i2WoSHEm6XMoQRMwmPsIfdNj5oEkfm1gDNCnBcP
 FBzY1EfGkqPZsPoYsUm2Crf+/+R1dwZK1aOX48e7ntJl91enZF3WA1MRLK7bWAjONff9
 DXLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9XWB7M14nyvMqZydjA+YUPnkBr8qEA84cSQUBW46B1EIeEDsn00NXsgIqprjco/Cs4mXhYdlJJnU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTLgPM6rymJlYA8tCOjloyvohJdS1wHdyYBJ3UmsIqRko5VIsG
 s16gHuJZIlNng8/GRKJpcdZJMw0gbLibPndlzEJwB5p2+/Hm8UiL9SmDS1ur+guZa++UmbMLaR4
 RH1KDSAYFPRBPwn7GLoMD2h20xHCeCdQa7N6DEEP8V74psa6TdvkdKIqa2HqXrc8x/O4tMLaRKF
 aHzq8=
X-Gm-Gg: AY/fxX7eYxtvwmKucP/2Gd/QGWZsc1UzvcTwOe/7lVWh6o+gNtcc2qlbc5FoV0yWYKw
 kg7/VEhUsN+xkLxhpz+tfdeWZuT6yWFCrjIc8iG4YuYOpBO47KQxy6swkA6/pKFY4Njp5bdf7BE
 CYb7P1C2iKGpudQjOSrDK0qsluZxFo6Q0kDOY82CS7yKWuEYp4jWwiuUSGpowWfcRJ8Iv/KGIOJ
 SyYTQr41G+U5zAp5Wx/268KyhITOzKJp0tZKYBWFzywIIBaV1294392C7ImPM5CJ9bMi34SSbfI
 WMHnycKfZt9la+QSqnOTMSoCiVk3Bf6mpE7d7Re/GaZfh19go9pdpF5yP1kf52y9NPyX1V0Ymll
 /YkC6/JUvBy9eyuG8sZS/Dp9fGVpHVuNzYUE+HOTt1H74sTMEQ2OC0MUMUdFMEpD8JsM=
X-Received: by 2002:a05:6122:9003:b0:563:42b5:457d with SMTP id
 71dfb90a1353d-56347fdbc21mr5167784e0c.3.1768318324051; 
 Tue, 13 Jan 2026 07:32:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDxp+V1DqoIerolnxPkbDym8KjSTKMypTINzAGYcZIuAStLsVttNXF1ApjLb6xX+Kb3BXSCQ==
X-Received: by 2002:a05:6122:9003:b0:563:42b5:457d with SMTP id
 71dfb90a1353d-56347fdbc21mr5167689e0c.3.1768318322712; 
 Tue, 13 Jan 2026 07:32:02 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b872152ee10sm534347566b.34.2026.01.13.07.31.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 07:32:01 -0800 (PST)
Message-ID: <0f786783-db0d-4bae-b3ea-cab2ea85223e@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 16:31:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Retrieve information about DDR from SMEM
To: Connor Abbott <cwabbott0@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <CACu1E7EDmLPhUFyouD=W6n+U7=oo7+6PY0Gz9=3pVpT2Qu9Z6w@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7EDmLPhUFyouD=W6n+U7=oo7+6PY0Gz9=3pVpT2Qu9Z6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: C6sBQzrspB0BmVfX7PC5GUlMrepKFYb_
X-Proofpoint-GUID: C6sBQzrspB0BmVfX7PC5GUlMrepKFYb_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyOSBTYWx0ZWRfX9djmaD659Jnp
 B2GRIHkSd0RKIUxc+dJP/QijN7A19T6qbvATobilU1M5mYKwPnvS1D+otPXynqHcyo2OQjmy4Ea
 +2mELy/2f8PGAnX/xrJKDYymNSZ9MN0wDi+/gf6XEhsuSh02HFvZJejY2lxPFxyGLrgDf82Ra24
 9O6xqtlMg1d+umDIiiw4LJoEqVKlKmuVAvWcIxfPMfXoXbLL+bqUNs/WQJ7RHiQmcDXAcvEU2B9
 QSwVmZzTyJXCQP76IRPE2rfXpZqEnnGBvYRQ9l9HvhU8Gm1Y/ky231miHJef14hGYYBDeluui70
 5HM9tcuomvu5LnRT4XerZOTP9EPB/IHIMIf7/PbM+jB0r3tVo09idSj4zGRs/jRjAqrrQUAOsN3
 P3oolI5e6Px6MywmLhpj/ss/EUx536vbSK3bc959FQjkIqqJc9m7wihkCl0LRdZ0vJkIODtWTLL
 0i5hpRzHCZ226iALpcg==
X-Authority-Analysis: v=2.4 cv=PvSergM3 c=1 sm=1 tr=0 ts=69666576 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=zvAHPaQ1O9Bprg_nwmMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130129
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

On 1/9/26 8:11 PM, Connor Abbott wrote:
> On Thu, Jan 8, 2026 at 9:22 AM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> SMEM allows the OS to retrieve information about the DDR memory.
>> Among that information, is a semi-magic value called 'HBB', or Highest
>> Bank address Bit, which multimedia drivers (for hardware like Adreno
>> and MDSS) must retrieve in order to program the IP blocks correctly.
>>
>> This series introduces an API to retrieve that value, uses it in the
>> aforementioned programming sequences and exposes available DDR
>> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
>> information can be exposed in the future, as needed.
>>
>> Patch 3 should really be merged after 1&2
> 
> No. The HBB value currently returned by the bootloader is *not* always
> the same as what we use currently, because some SoCs (like SM8250)
> with the same DT ship with multiple different DRAM configurations and
> we've been using a sub-optimal value the whole time. After all, that's
> the whole point of using the bootloader value. But patches 1&2 will
> only make the DPU use the bootloader value for HBB, not the GPU. So on
> one of the affected SoCs, it will introduce a mismatch. You can't
> change anything until the GPU side uses the new ubwc config as its
> source of truth.

You're right, sorry for that

Konrad
