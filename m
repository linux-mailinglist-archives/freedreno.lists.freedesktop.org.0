Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 256D4B04C79
	for <lists+freedreno@lfdr.de>; Tue, 15 Jul 2025 01:40:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECFB910E0C2;
	Mon, 14 Jul 2025 23:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HZv3y7C7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13AA010E111
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 23:40:49 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EGSwL0012753
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 23:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yXi+Vfo70q22tr3GBwXIimObUqUqXmPUkoh91UkH8FU=; b=HZv3y7C7URS8ZUn+
 Q1l4TUF1kw5kagXw4WUZfSNvS7sEH6cH4tMAmlGHSxeK3AQvLkLxaOvVQLvhxsQQ
 11SOhCFMg8n5LLQgMv0hXA4PwOdZfxiLcmSyV61eLT5xcUVz4T40Ct12OW8jClhO
 E/43i6bMC0e8sDtwPYlx/AaMGHACnkPV15N65NdIRsgFvJD/8bpeCmJBheRIseiO
 FNEJHjiUDRZxt/s/CoH2bv9Et/s2nKRt7zWL0N3D/cMfJbpT1ONitwigWwB7cvoG
 gemzBK00GFqnmAnkhnPAq0NI8dWAwHtjVdz6vvlfIfNLa+WN9+m6xzsVfC8XIP8u
 PMVdMQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dygxx4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 23:40:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6fb030f541bso17285006d6.1
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 16:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752536447; x=1753141247;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yXi+Vfo70q22tr3GBwXIimObUqUqXmPUkoh91UkH8FU=;
 b=Zp2H+XdlDf35MmK7By5ZJKymk0/3ygItJfjEjvzG4qUommmK1wDsj7lPhSXkjB4I1b
 OUw/Isd+AL2n/NqPyLeZ4ejRqJlNFEbV9mQTyVqND4ZbL16ZP9HCo2hvFPQEjXzBNjcR
 ahYpt/qBTaNBxLMDP8LR0/Uf1Oqork9xeHWnlZizbv5PxJFhL0n3S63GZ8C4OeqEEUZ/
 wmpJpPpe2TmE4E78tle7AOj68OzKkf4nk2vSHTf7MXuAVBmOBRmomht03vrmiAEh/X6V
 6zagtkFonBsbaZuHnJukDEiSqP4zIZIJKFyD0AH1vrNe8X7Hfad1g+DBv03mlaRWVK1C
 B9cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUrl2/vn6fTLtB7HRPoj+q0wc34tjdTK3w2wsCqTgY1O1XIZTCV99fR+JripLZpjhCIO39dRKRB/Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9yCdU+K8rC7mHnrZemx7/zpGCoXwsN2x5yO+rBPJImbZuMERc
 Is11vavSZ+w+SnQb38JwHASjLaqiYx9t66ss4ujQ9sSjgh747t24WjJmalsB9bhI7N/tH9/Ggje
 /DsWUR7Hh8RnsMpigkhqyJGihxswHd+yN0e1H89T98QfNpBiOnzLUFz78Esb2JKo8Yvr2P0Q=
X-Gm-Gg: ASbGncsQM8ZYI27qTGCSoMTl4WSzNGfmcZkJDDoIsTW4N39JuO3+WI3DoORn1JAfAiy
 Yk5kUCCNzWLs13CvL94GmHtyaMmQs1aOFpWFYs329SRXQUSs4S6I26FsfG6xQwjJpA2DUikRs9Q
 S6QxEfp9rlLf1jJEUpVsLJNOiodLgjD0YnPBHNYglaYjb+wWDCG9oz3ErKVeULkA7wg/agQA1SR
 k53D7HC+VYXhL+WnJny5eAxkT3SYw/rReSliXIkOObwePeT42x6qeARjy+oaQ+xZ4YCFUWqEtH6
 OGcJd3Ac2dQcsbdlcII9+SzDP7lock86EsmqebTm9J29QP67T1YQ8VGkt3X3wF2XbTcptnXf5vg
 1Ug2g9lLU44CQVQUkxX6R
X-Received: by 2002:a05:620a:d86:b0:7d3:f0a1:2f3e with SMTP id
 af79cd13be357-7dde99530b9mr793273985a.2.1752536446972; 
 Mon, 14 Jul 2025 16:40:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEND06f7E/xldG2SwiZSQTbgDcvn/Jbw/7eu/cnbVCi9unjwVVB7Y5X5mBj0MZNrcNpy8/YbQ==
X-Received: by 2002:a05:620a:d86:b0:7d3:f0a1:2f3e with SMTP id
 af79cd13be357-7dde99530b9mr793272685a.2.1752536446427; 
 Mon, 14 Jul 2025 16:40:46 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e829d061sm909166966b.142.2025.07.14.16.40.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 16:40:45 -0700 (PDT)
Message-ID: <5567e441-055d-443a-b117-ec16b53dc059@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 01:40:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ci: Remove sdm845/cheza jobs
To: rob.clark@oss.qualcomm.com, Doug Anderson <dianders@chromium.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Helen Koike <helen.fornazier@gmail.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250629135843.30097-1-robin.clark@oss.qualcomm.com>
 <92314f06-e6a8-4882-a31c-914438d7761d@oss.qualcomm.com>
 <CACSVV01AUOp7vZ7kLt+gwxvfv4CYLtAQg6MhUccygbi1NpVJMg@mail.gmail.com>
 <aaaa42ed-989e-43ee-8d45-2908f52e8584@oss.qualcomm.com>
 <d323ceed-19e2-4b17-b97e-0833f132be16@oss.qualcomm.com>
 <CAD=FV=VV_xvcWwdpi88wSYWXyftUP5eP-SQVkgEBRQgfwDN+zg@mail.gmail.com>
 <CACSVV01PkDKWSRq4eQCJGFePKmSKmFdkNFt2PSC4w+r1U9nZuw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACSVV01PkDKWSRq4eQCJGFePKmSKmFdkNFt2PSC4w+r1U9nZuw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: iP98TzQB8kCCm3tQwUswZv-n_PE_2oi4
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=68759580 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=dRXE1jWJAAAA:8 a=cm27Pg_UAAAA:8
 a=EUspDBNiAAAA:8 a=Jp5PGaZ2n-Q8juSPBdEA:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=I84_JwFgYcz8Gf5-qaVM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDE2OSBTYWx0ZWRfXwiDc7Plfcv3f
 m00uLlqdvH3GV9Ny2HHLI2MkagxhgUFZvb/IsmtrCkpde637jT7jeD/hITt2LUB6vnv0ktEtr9S
 6Dr4EV5Ry1QGSUdS21i5ADC3DD7FMFSTv7ljXxbF/wZiW2IojzI8JIwkvYLItJs98EO0RmrqPT1
 CQrixMr7W3EdZDMIgVa45fz2hD/4+WPBZ902u32zVJxguHqN7eMZO5wMXusalyCSVRrRZc0WuhK
 LamUiEN7RHE2JYdjH9rLLx2+QaT+JibLC6RPlqpthRG7V+Y8he+MMiEEKl6BTfEI+m0oeop9SHe
 mudzqPvvIiHpomOpGjCPlj1usaW5TJnlVa5OPi7g/Lk6qpgynqynF5JKjsEDMlQHEangqMdk19k
 YWN2trQhHfu+u54NwFZAhgRDa+C5BrCi4ND5AsgXS8ag5pAalSAfbTMI2Li6lqmU7CwWRLG/
X-Proofpoint-GUID: iP98TzQB8kCCm3tQwUswZv-n_PE_2oi4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140169
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

On 7/14/25 10:08 PM, Rob Clark wrote:
> On Mon, Jul 14, 2025 at 12:56 PM Doug Anderson <dianders@chromium.org> wrote:
>>
>> Hi,
>>
>> On Mon, Jun 30, 2025 at 9:15 AM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>>
>>> On 6/30/2025 9:26 PM, Konrad Dybcio wrote:
>>>>
>>>>
>>>> On 30-Jun-25 15:46, Rob Clark wrote:
>>>>> On Mon, Jun 30, 2025 at 3:34 AM Konrad Dybcio
>>>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 29-Jun-25 15:58, Rob Clark wrote:
>>>>>>> These runners are no more.  So remove the jobs.
>>>>>>>
>>>>>>> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
>>>>>>> ---
>>>>>>
>>>>>> Do we have anyone using cheza at all anymore then?
>>>>>
>>>>> Probably not
>>>>
>>>> Adding +Doug +Akhil +Jessica, if we don't have any users, we may
>>>> get rid of it upstream, as it never made it to the outside-outside
>>>> world..
>>>>
>>>> Konrad
>>>
>>> I am not aware of anyone using Cheza boards within Qcom. So it is fine
>>> with me if you plan to remove the DT bits.
>>
>> As far as I'm aware, anyone at Google who had a cheza gave it to Rob
>> to put in his lab. If Rob says nobody is using it then I'm 99.9%
>> certain that nobody at Google is using it anymore. There were a very
>> small number of external developers who were given a cheza prototype
>> but I can't quite imagine any of them still using it.
> 
> If it helps, this is what the batteries looked like when we pulled the
> cheza's out of the CI farm:
> 
> https://photos.app.goo.gl/Eh8EJhqBhKUuYfiH8
> 
> ;-)

Spicy!

Thanks for confirming folks

Konrad
