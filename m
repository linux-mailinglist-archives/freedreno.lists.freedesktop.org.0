Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD8F561F00
	for <lists+freedreno@lfdr.de>; Thu, 30 Jun 2022 17:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CCE710F5EB;
	Thu, 30 Jun 2022 15:17:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BD010F5EB;
 Thu, 30 Jun 2022 15:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1656602278; x=1688138278;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FDi0FOKTrj8PQy31Ckcb5baI4yZzM2OKFrPDYMBFWyQ=;
 b=fAMALFF96QJJx02GpidsUetH1xR7zbCxptjGyzEF7OvkrfEAOlNAqifr
 CVaNX9ZDSrVBL/P1SbdP7MUTONUF/I2JrwErPVSHCQIe+17TLHVKMEQqH
 S9UPP7WF9tBxkKpPwiUpkkGvTPzyqdE99VQ34dIMXQfed5aC6hZU+U+ja E=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 30 Jun 2022 08:17:58 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 08:17:57 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 30 Jun 2022 08:17:56 -0700
Received: from [10.216.41.7] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 30 Jun
 2022 08:17:50 -0700
Message-ID: <78bfe8bd-b07e-5a53-156b-ad8b24829f29@quicinc.com>
Date: Thu, 30 Jun 2022 20:47:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: Joe Perches <joe@perches.com>, Konrad Dybcio
 <konrad.dybcio@somainline.org>, <~postmarketos/upstreaming@lists.sr.ht>
References: <20220528160353.157870-1-konrad.dybcio@somainline.org>
 <20220528160353.157870-4-konrad.dybcio@somainline.org>
 <d470331985c7d82c6e5bb6d548ab610479416761.camel@perches.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <d470331985c7d82c6e5bb6d548ab610479416761.camel@perches.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Subject: Re: [Freedreno] [PATCH v3 4/4] drm/msm/adreno: Fix up formatting
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, jamipkettunen@somainline.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 martin.botka@somainline.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, angelogioacchino.delregno@somainline.org,
 marijn.suijten@somainline.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 5/28/2022 10:22 PM, Joe Perches wrote:
> On Sat, 2022-05-28 at 18:03 +0200, Konrad Dybcio wrote:
>> Leading spaces are not something checkpatch likes, and it says so when
>> they are present. Use tabs consistently to indent function body and
>> unwrap a 83-char-long line, as 100 is cool nowadays.
> unassociated trivia:
>
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> []
>> @@ -199,7 +199,7 @@ static inline int adreno_is_a420(struct adreno_gpu *gpu)
>>   
>>   static inline int adreno_is_a430(struct adreno_gpu *gpu)
>>   {
>> -       return gpu->revn == 430;
>> +	return gpu->revn == 430;
>>   }
> looks like these could/should return bool
But this is just a format fix.

>
>>   static inline int adreno_is_a506(struct adreno_gpu *gpu)
>> @@ -239,7 +239,7 @@ static inline int adreno_is_a540(struct adreno_gpu *gpu)
>>   
>>   static inline int adreno_is_a618(struct adreno_gpu *gpu)
>>   {
>> -       return gpu->revn == 618;
>> +	return gpu->revn == 618;
>>   }
> etc...

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>


-Akhil.
