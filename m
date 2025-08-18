Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B72F3B29A8E
	for <lists+freedreno@lfdr.de>; Mon, 18 Aug 2025 09:12:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037DA10E3D1;
	Mon, 18 Aug 2025 07:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QYbhG0f/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85FA510E3D1
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 07:12:15 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HMK43Y010089
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 07:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4eFYXz9ONO1rsY5R32v0zLbnZIBbCFLEnN5L1WePSYw=; b=QYbhG0f/BizLaN4O
 qrCEu1wgP5dLhf5YHg10PV9FviLlk2c04Fk0CYbcaW4UrT3bkDRTOUtTEV27nsnd
 tLC+RY3HcCtH7izvACthiqjiJOd0ukxuPf1B9/pJcTr2EIkK0tRvs4DS9/m86eBE
 Qvh2Hq3qNIPWPH8q7l4iMaa6mBlfh7vYNEcMgCKPRZqEMOZsBPy6om3k5/i3/E9/
 idCYZ5a9QAdbLFE/IbFqV7o4taQDmtjrCJDEnNZafKA6RjAAoiosOA536UKjufU8
 6px759Nvjy065YYJvYvgGHp8pT/KNrXIdQJphvKIq9pvVOqOYVKvTslynFsQE4TZ
 jA7Unw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk99kkka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 07:12:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2445806dc88so97836015ad.1
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 00:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755501118; x=1756105918;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4eFYXz9ONO1rsY5R32v0zLbnZIBbCFLEnN5L1WePSYw=;
 b=fkrzuofBXrmv3Nk+rjmBFT5dNrDR0w5A237Fbtm3w20BpF7/JogTADzvzlFUYpcgQH
 dpH3XhtfpIk37Prxxy2NFGX4AzOAvvh3WpDlErTwbeAIiSxAk+y6H2e3TSZOYtQKgvH/
 FkAcp9UkmBZGK/5ocgRHDBkpAwawEtNKlpWmFtdVt/cRsbSzDxRk3nnGg2MwWtJ2nBYX
 3watKEwybY8pZRm68I0ht1eMeRFEEbSMDAtRrlWd6UzITZwn3+rAEXVFkrfSoYo5r/R3
 8WBvGIeYEcC/p6MVD3A+S3/fy7DlE05WBlAxpvNrk/8cbZNDqylMWeGoi9UP3Q3FXAqE
 hLNA==
X-Gm-Message-State: AOJu0YygRnlNLFa8j/q4bBHZOtLqSQki3TqE2eQod0muy+Zq9kFMsS+x
 umk1v+FYF1mezkktZOASwiv3QMa31pAk4QGKOmA1TeSv0PFLy6MeZR8elc9Cj3/AeVh3HfR4A6S
 EJ1RRa+UFF9FlfQojS5ZqzJ7Rl9rlgBsWsOsv650IkSMnDXyK06EAhDbdBJAou5cDC9kEfUs=
X-Gm-Gg: ASbGncsrowkq8qFuqNYJ+fYHw9hUzArld9dLUDqEABf8P2DtYnI2l/AGwaDJkqRkmVT
 YzaGwqWIzYRK5ol4/EITq5StSjS4SS7m/r2lFuZ4WpYHhW1oE3QaK0owzylqLHDbRZTIMkY/mPy
 gQkYno+8iQzzZ1hLOdv2PVgQCEPqcQR4YJEWAcJT+DClL45EVt+80slVjypQyzIFT3E8e5JeYBK
 nWcMRa0UBzFeQi/8LiPpSpa3E9iIJyPV12we71WTrPxUEcQUe0q8y1F1DbVpolwlPoTYDAH7qwp
 XK6atySvm70D8r2efG07do6/kJ+SHRd4EPSYd0IaLwAWCdQ1COJkoLJSpf7px+Qu
X-Received: by 2002:a17:902:ebc2:b0:243:3c4:ccaa with SMTP id
 d9443c01a7336-2446d73b8c7mr151281355ad.19.1755501117639; 
 Mon, 18 Aug 2025 00:11:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiKyMj6H6ZQGoeu6S6teayibAv7/eiOIKjBX05pyjGvBOWtXvqxZQgvbi+2YXGev75Ro/9hA==
X-Received: by 2002:a17:902:ebc2:b0:243:3c4:ccaa with SMTP id
 d9443c01a7336-2446d73b8c7mr151281085ad.19.1755501117167; 
 Mon, 18 Aug 2025 00:11:57 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.229.157])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32343c6f284sm7039663a91.24.2025.08.18.00.11.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 00:11:56 -0700 (PDT)
Message-ID: <1051801e-2537-4ef5-9d24-5c3fbf7d79dd@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 12:41:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] drm/msm/adreno: Add support for ACD
To: Rob Clark <robdclark@gmail.com>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: freedreno@lists.freedesktop.org
References: <aJTL87hBAEtJb3VT@stanley.mountain>
 <2d54964b-1f60-4a58-8064-567611a3a126@oss.qualcomm.com>
 <aJwnNqfxZHfiVHZB@stanley.mountain>
 <cdd4757f-9433-4c80-b5b2-003d42038a87@oss.qualcomm.com>
 <aJ2K26ZBVZilC8jg@stanley.mountain>
 <CAF6AEGuO-8Y-dqsXZa5Oi4fTdzzWsOss5KEhyUkqiGCyuhVrdw@mail.gmail.com>
 <aJ7OJq4nwkAXp6SR@stanley.mountain>
 <CAF6AEGuySMUDOf3gWU3FdQXxwJkmfURK1mBOGyjrYtJdZ_U_Rw@mail.gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAF6AEGuySMUDOf3gWU3FdQXxwJkmfURK1mBOGyjrYtJdZ_U_Rw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jecz09R4TkEeJsVUI0caCOAkPp4nc0qG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0NSBTYWx0ZWRfX46A/XvbjKmAs
 8FuSxJBjLZINfA+ADdVV56mtXg1tqWaZf6tERrl82jkk3m8uzrYVc+W0WRihT6TkX2ChDEyRAUG
 Fuzc6lLGrcEJ4CabJgEs5yPN1JvQMG6B9F+HAVuG1WttwihGD1v2VeqKJ4UqfZ+cUsO7awF7FzJ
 YVIsdc/7dxqvCRlNbgMnD+sfk15Xqus5sqWx+BQXgTIQc5rtrFT+3HcYwnQEGriTw8fRdPdKFDc
 j9YtXBFhwqe/gyA7lykOi0PqXyjMHMotvmxjqxVljUpgiQICE/ELmjPyXEo62SHzi8bjyPXnmbt
 BxysW+A7FOSVOVFhc+yLclGMU0gEFHCcHwbE/a4yrcI6jLew8IWDwHzWnqiQt9s+dfqM3AWOSiG
 jcrnveoA
X-Authority-Analysis: v=2.4 cv=IIMCChvG c=1 sm=1 tr=0 ts=68a2d24d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=9Q8gPALlkHEzzDxkdHlyxw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=0beGzprJXZfq2z5psJEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: jecz09R4TkEeJsVUI0caCOAkPp4nc0qG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160045
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

On 8/15/2025 7:59 PM, Rob Clark wrote:
> On Thu, Aug 14, 2025 at 11:05 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
>>
>> On Thu, Aug 14, 2025 at 06:57:35AM -0700, Rob Clark wrote:
>>> On Thu, Aug 14, 2025 at 12:06 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
>>>>
>>>> On Thu, Aug 14, 2025 at 12:28:31AM +0530, Akhil P Oommen wrote:
>>>>> On 8/13/2025 11:18 AM, Dan Carpenter wrote:
>>>>>> On Fri, Aug 08, 2025 at 10:28:38PM +0530, Akhil P Oommen wrote:
>>>>>>> On 8/7/2025 9:23 PM, Dan Carpenter wrote:
>>>>>>>> Hello Akhil P Oommen,
>>>>>>>>
>>>>>>>> Commit b733fe7bff8b ("drm/msm/adreno: Add support for ACD") from Apr
>>>>>>>> 19, 2025 (linux-next), leads to the following Smatch static checker
>>>>>>>> warning:
>>>>>>>>
>>>>>>>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1700 a6xx_gmu_acd_probe()
>>>>>>>>   error: 'opp' dereferencing possible ERR_PTR()
>>>>>>>>
>>>>>>>> drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>>>>>>     1668 static int a6xx_gmu_acd_probe(struct a6xx_gmu *gmu)
>>>>>>>>     1669 {
>>>>>>>>     1670         struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>>>>>>>>     1671         struct a6xx_hfi_acd_table *cmd = &gmu->acd_table;
>>>>>>>>     1672         struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>>>>>>>>     1673         struct msm_gpu *gpu = &adreno_gpu->base;
>>>>>>>>     1674         int ret, i, cmd_idx = 0;
>>>>>>>>     1675         extern bool disable_acd;
>>>>>>>>     1676
>>>>>>>>     1677         /* Skip ACD probe if requested via module param */
>>>>>>>>     1678         if (disable_acd) {
>>>>>>>>     1679                 DRM_DEV_ERROR(gmu->dev, "Skipping GPU ACD probe\n");
>>>>>>>>     1680                 return 0;
>>>>>>>>     1681         }
>>>>>>>>     1682
>>>>>>>>     1683         cmd->version = 1;
>>>>>>>>     1684         cmd->stride = 1;
>>>>>>>>     1685         cmd->enable_by_level = 0;
>>>>>>>>     1686
>>>>>>>>     1687         /* Skip freq = 0 and parse acd-level for rest of the OPPs */
>>>>>>>>     1688         for (i = 1; i < gmu->nr_gpu_freqs; i++) {
>>>>>>>>     1689                 struct dev_pm_opp *opp;
>>>>>>>>     1690                 struct device_node *np;
>>>>>>>>     1691                 unsigned long freq;
>>>>>>>>     1692                 u32 val;
>>>>>>>>     1693
>>>>>>>>     1694                 freq = gmu->gpu_freqs[i];
>>>>>>>>     1695                 opp = dev_pm_opp_find_freq_exact(&gpu->pdev->dev, freq, true);
>>>>>>>>                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>>>>>> No error checking.
>>>>>>>
>>>>>>> We are passing back a freq which we pulled out from the opp_table a few
>>>>>>> lines before this. So it is unlikely that this call would fail.
>>>>>>>
>>>>>>> But it is okay to add a check here if that would make Smatch checker happy.
>>>>>>>
>>>>>>
>>>>>> No, no, just ignore it, if it can't fail.
>>>>>>
>>>>>> Or I can add dev_pm_opp_find_freq_exact() to the "no need to check" list.
>>>>>> That's easy to do.
>>>>>
>>>>> Would that make Smatch ignore usage of "dev_pm_opp_find_freq_exact()" in
>>>>> other code/drivers? If yes, we may not want that.
>>>>
>>>> It just wouldn't print this warning if people left off the error handling.
>>>>
>>>> I'm going to ignore it anyway, right?  I recently had a case where I got
>>>> mixed up which functions needed error handling and I ignored the wrong one.
>>>> We still caught it in testing, but I'm also going through and marking which ones
>>>> to ignore or not.
>>>
>>> drive-by comment:  Would it be useful to have a comment that smatch
>>> could look for in cases like this.. similar to how rust has a practice
>>> of adding a comment describing unsafe blocks?  It could be a useful
>>> way to document "safe because: this isn't expected to fail" cases,
>>> both for humans and tools.
>>>
>>
>> I don't want to litter the code with comments silencing Smatch warnings.
>>
>> Adding a comment for humans would be enough.  I hand review all these
>> warnings so I'd see the comment.  Otherwise, generally, I try to only
>> send warnings once.  We fix all the real bugs so all old warnings are
>> false positives.
> 
> ok, well I think we should at least add a comment here for humans

Yeah. I will add this to my list.

-Akhil

> 
> BR,
> -R
> 
>> regards,
>> dan carpenter

