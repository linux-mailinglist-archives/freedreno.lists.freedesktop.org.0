Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C826FB3FC0F
	for <lists+freedreno@lfdr.de>; Tue,  2 Sep 2025 12:19:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F2210E651;
	Tue,  2 Sep 2025 10:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iJa1aZtN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B95A10E650
 for <freedreno@lists.freedesktop.org>; Tue,  2 Sep 2025 10:19:19 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822RlFZ012433
 for <freedreno@lists.freedesktop.org>; Tue, 2 Sep 2025 10:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 br24zZfPUMh2y5hphW6eSZrx2KUZEQPgg53oVJYo2X8=; b=iJa1aZtNGpYUsLtH
 m1ASUdi9WGVZUi0Z49LkP+EvwspangHxNaWLIMdnNHvetGnlp4ED/YlZPhZRziSE
 ZwHP2SWGpvO5791IK5bvAGBDV2yr6OPvPIiFQ+mTOaBT7xDmhxLEryuErswaUDGr
 BcZ/QGtbAu8UnRYzUZqwJ71NT66l682265rzx9lPYlkC9aOUvX39Geexba7Z0l/L
 GhzZy02uYiaqenl8frn7LcCDeflWRQtQR602svxMh/JV1ASRE3rNaixMVqsDg4SR
 C6d0yZqMpy2R3wrQXQFyiCcxwYJMZDjP+4BjoTnAmtNhp6Vtye8PaAque6jQ63v3
 xVTv5A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0efjxn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 10:19:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-24afab6d4a7so18271145ad.1
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 03:19:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756808358; x=1757413158;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=br24zZfPUMh2y5hphW6eSZrx2KUZEQPgg53oVJYo2X8=;
 b=hCtDcoiecFuFGfMB2N43Rm5o0CVWnbk3PspsOpunCtLGVsCh97+ev2xFaCtq8Ja2ub
 ejYR7I7qgII31hcblupzOgrnxN0XQaVPbpO5cquBm4WFmwBzHFiIfSV3ggU0a2AwM3aK
 p1UEZcwD2jiPVEMyRoHbqg/kDUnt+rfdlHohh2ecZUjnOzV9fyK6DZ7lOl023zk1BKnu
 Vqcu0eOZd31OjV4pPb8exgM/gTqKwlot7GUrDBZIfcnCwdjcEvSUmxxfCgDE7gBw/MaU
 sLzIPZXk2UHWRF7fvx6ZhLhTALi5WxKYLK2zpLCSltD/2vlsw8m9Sxycf9HC6wD3Ubdg
 fQLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVi9nYUrw4MvkshaCOwshOI5cS46HulOQAtyNba1xdnjioIfua4a61b1sjZqICcJmhpqDl4jGIa68A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwC+sYfv1JaB/H83JjS3v0nDvNI2CBkij5HWj80EttQmtqBtqaV
 PAUGJnVilXgD6KlQSOaOKSDP5y5eFBGzK057NjMkix4KkQT9BCVroV29YKzhOBfu0isBmHLS4NQ
 9xkwOdmQb7CnsePywuj10fIYVkguTY8zLQpK786SSOLbF1e6Q4waMapghIDx7y0PwsYYN14U=
X-Gm-Gg: ASbGncukbQcNtwNQo+j2j54G+FfaPLB4CQ79q244UK629O8SnEKtfv9qOKQGndVNhoB
 LS41EHOoCGw3r6odkrOj0g5TFGtkjbKeTi4wBX4leFEceeL2uuuNSnTlKtvxnlhgSY2zXSLg3s0
 CcD3cVK/0iatxJThNSQEldFR1WUQxDb8RidGUi+6vRmdmC+NjoR0lGeTGnlF0tBIAK9jNMPcZ6l
 ixuiwOvyWVTmHYbf7eHUNkZl/5ftS8tr3Gu3X7wuIrne+3HRE4/SzMPrwwhOHQ3V7z3OT4RTS5C
 VRY4RNCck1b3NA/DI2t0JKVzbETpnLAEXLx503gV8l3O3OxZ+6n7p3ULCovEen1tBVWxUQ5ColX
 G2Nws4IxoAuIxwPyypNmQ9HxGNPQUeA==
X-Received: by 2002:a17:903:2ca:b0:246:2afa:4cc with SMTP id
 d9443c01a7336-24944accdccmr125618975ad.42.1756808357944; 
 Tue, 02 Sep 2025 03:19:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExZaQpujI+DBeEgb+OY+oIAOGhyp2Ov4L53Do99REhENCXH8YvVx3wL9zFdzC8VQf9tej07A==
X-Received: by 2002:a17:903:2ca:b0:246:2afa:4cc with SMTP id
 d9443c01a7336-24944accdccmr125618675ad.42.1756808357534; 
 Tue, 02 Sep 2025 03:19:17 -0700 (PDT)
Received: from [10.133.33.25] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-249065899f3sm125975505ad.113.2025.09.02.03.19.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 03:19:17 -0700 (PDT)
Message-ID: <d7141b57-fa3c-49ce-9830-8310a58b9581@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 18:19:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/38] drm/msm/dp: remove cached drm_edid from panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-1-01faacfcdedd@oss.qualcomm.com>
 <otmy4kttxflsxkvacwdsqynck4nqeww7jsxaq2xwjtlooxnhvx@gmpezdliskck>
 <5b142910-81e7-462d-8933-70705334ef0a@oss.qualcomm.com>
 <yarnaujunszlfrbduakodv7n63wjgh6og3t4qowhu3n6tz6fmn@4kb4crd5rqq7>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <yarnaujunszlfrbduakodv7n63wjgh6og3t4qowhu3n6tz6fmn@4kb4crd5rqq7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _BRxqjZ6o_oPFR3Wm5rtV7a9rXlkBa8y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfXzZu6pe7lejt2
 P6FdirVM3IyBADz2ohSGobC0zfpwmD8SiaZPtFhqbowhdiUmMwmxnIjUnO7iuVAjH9cYtTMfuwc
 qEpClLeDnqRbyZmuvSDbBmxuhuoaIn68b2XuV+/ZPKliBk1DsMf3BuBKRtU2BDd+gBx9w/I1cZU
 UYosLGyRS+SvlpMbbHpHK8cD4SKrvjFNDhjYIeDTPbyxVKg8kD/sLEZIooU7LzuEChw2mjlkCOh
 gljJmX9gx8UfH6fTY7DBF3wYLIqigTW0IaYuElKNf9QEJiF0CqqN807WxqDgvZfXeZBH9ou6T+A
 +a5mUuhlrI1RzsHRqAmQG1lmpuHTwteMrOJc/CdrQTU1dWoFil5k3m771FPv5vdbET4w8j553BM
 wjYJ9qMI
X-Proofpoint-ORIG-GUID: _BRxqjZ6o_oPFR3Wm5rtV7a9rXlkBa8y
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b6c4a7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=PD6ve5_SbK8zx8cgC-cA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004
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



On 9/2/2025 5:36 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 02, 2025 at 04:42:18PM +0800, Yongxing Mou wrote:
>>
>>
>> On 8/26/2025 12:41 AM, Dmitry Baryshkov wrote:
>>> On Mon, Aug 25, 2025 at 10:15:47PM +0800, Yongxing Mou wrote:
>>>> The cached drm_edid in msm_dp_panel was redundant and led to unnecessary
>>>> state management complexity. This change removes the drm_edid member from
>>>
>>> Please see Documentation/process/submitting-patches.rst on how to write
>>> commit messages. Please use imperative language instead of describing
>>> the changes.
>>>
>>> THe patch LGTM.
>>>
>> Thanks, will update it in next version. Since the HPD refactor series are
>> unlikely to be merged soon. Can I separate out some patches from the MST
>> series that don't have dependencies and send them individually to make it
>> get applied? This would help reduce the number of the MST series.
> 
> Yes, of course. Please keep version number monothonic for those patches
> (e.g. by telling b4 that it should start from v4).
> 
Sure. Thanks,  I want to confirm whether the patches should be sent 
individually or grouped into a series? They seem to be logically 
unrelated. I was originally planning to send each one separately.>>
>>>> the panel structure and refactors related functions to use locally read
>>>> EDID data instead.
>>>>
>>>> - Replaces msm_dp_panel_read_sink_caps() with msm_dp_panel_read_link_caps()
>>>> - Updates msm_dp_panel_handle_sink_request() to accept drm_edid as input
>>>> - Removes msm_dp_panel_get_modes() and drm_edid caching logic
>>>> - Cleans up unused drm_edid_free() calls
>>>>
>>>> This simplifies EDID handling and avoids stale data issues.
>>>>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_display.c | 28 +++++++++++++++-------
>>>>    drivers/gpu/drm/msm/dp/dp_panel.c   | 47 ++++---------------------------------
>>>>    drivers/gpu/drm/msm/dp/dp_panel.h   |  9 +++----
>>>>    3 files changed, 26 insertions(+), 58 deletions(-)
>>>>
>>>
>>
>>
> 

