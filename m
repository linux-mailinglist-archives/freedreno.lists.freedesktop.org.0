Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 560DF676839
	for <lists+freedreno@lfdr.de>; Sat, 21 Jan 2023 20:06:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3C610E2C0;
	Sat, 21 Jan 2023 19:06:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9CC510E2B5
 for <freedreno@lists.freedesktop.org>; Sat, 21 Jan 2023 19:06:49 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 d4-20020a05600c3ac400b003db1de2aef0so5879902wms.2
 for <freedreno@lists.freedesktop.org>; Sat, 21 Jan 2023 11:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8DfHo6+2cR5G36izj5IdbaMWn0yli9T2fcLAtdygnkg=;
 b=nNVAF8Ai2srOYxgHMMSLcjMfMSJIaJKtNn8mahBIbadysRz6/1IaIYPCZc9fNT76X0
 /ld71XvhCdIoYYwg5Ip5ZweklxTNm/nIpdTF1HP/RSyhfC/kVrx3pbCWZ9+SjNuejh7l
 LFJjRISn7PlBP1HQEf4Bntv1ye+dlOM1fnoF9gIzimWx2Onki6KJn8IpvVriXVb5DipA
 W1zVr6hX8itcxEypRI4OR4t8FQH13XFCM2lHhED4F7mjnhCjhSCGpWb5Smc17w8qfmou
 CAeBQVgY657JeupI7OhXooH33r25EnulJ53FhTSFA+phOz2Ds+aaPR0YKIW24AEiwcuA
 xCvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8DfHo6+2cR5G36izj5IdbaMWn0yli9T2fcLAtdygnkg=;
 b=l3sEOywmWRAP8KxeyUkBB294x5gbxo0GoJor1Ps3tBJ4XaxhdrGdWuNgvsdcEUrbZS
 0S9v1oaxXEJTE9StJXONXa7S4R6w8uID2SVDOkrIeMP56dUh3ROxUTUq+IW8s6rcaGYd
 0BGhhN2dQpqRmHvs/Y9rhVzlbMni/JkbWuGxURzUl+byti7ePgx2g5saQeSOk3Fr+GKR
 iS+DzHFtSTOz1Gob+7IMWRSRpPtU7i6Z91F7kE5DRr0IO+pfG5L9Md00Y0KJnBj63OU0
 fewaANERzlhKKgCCDa0zkszWkW4H/2euDd6zsVun7xO18sNraqpngylD6th6vWMDjoH/
 Z0Dw==
X-Gm-Message-State: AFqh2kqHSHau/DLZ0TrElz5tpy5uPG1VODX3n2TUi+oZjMelf/U0cbhk
 qQAJIChtn7CH1t7dqv99QpuUgQ==
X-Google-Smtp-Source: AMrXdXs35m2RpMWRgaSk7+Xj1XDLefPiYN4z7MFYdzeMJV+rnK5EyVmWU+xxPWKMXb+fv0qYvz5pmw==
X-Received: by 2002:a05:600c:5021:b0:3d9:9755:d659 with SMTP id
 n33-20020a05600c502100b003d99755d659mr18386535wmr.22.1674328008214; 
 Sat, 21 Jan 2023 11:06:48 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 m26-20020a7bcb9a000000b003db2dede1a2sm5858414wmi.26.2023.01.21.11.06.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Jan 2023 11:06:47 -0800 (PST)
Message-ID: <3865e4ae-99e9-bba7-6abf-76d92e79b178@linaro.org>
Date: Sat, 21 Jan 2023 20:06:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Content-Language: en-US
To: Sean Paul <sean@poorly.run>
References: <20230118193015.911074-1-markyacoub@google.com>
 <20230118193015.911074-10-markyacoub@google.com>
 <aee03688-54b6-ed9f-e32c-b46e31d72198@linaro.org>
 <Y8q5UfpIg0+qnAuG@art_vandelay>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y8q5UfpIg0+qnAuG@art_vandelay>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v6 09/10] arm64: dts: qcom: sc7180: Add
 support for HDCP in dp-controller
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
Cc: quic_sbillaka@quicinc.com, imre.deak@intel.com,
 joonas.lahtinen@linux.intel.com, konrad.dybcio@somainline.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 arun.r.murthy@intel.com, krzysztof.kozlowski+dt@linaro.org, airlied@gmail.com,
 hbh25y@gmail.com, ville.syrjala@linux.intel.com, marex@denx.de,
 ashutosh.dixit@intel.com, abhinavk@codeaurora.org, javierm@redhat.com,
 quic_khsieh@quicinc.com, stanislav.lisovskiy@intel.com, agross@kernel.org,
 quic_jesszhan@quicinc.com, ankit.k.nautiyal@intel.com,
 devicetree@vger.kernel.org, lyude@redhat.com, tzimmermann@suse.de,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 lucas.demarchi@intel.com, quic_abhinavk@quicinc.com,
 jani.nikula@linux.intel.com, swboyd@chromium.org, robh+dt@kernel.org,
 christophe.jaillet@wanadoo.fr, jose.souza@intel.com, rodrigo.vivi@intel.com,
 bjorn.andersson@linaro.org, matthew.d.roper@intel.com, johan+linaro@kernel.org,
 tvrtko.ursulin@linux.intel.com, Mark Yacoub <markyacoub@chromium.org>,
 andersson@kernel.org, linux-kernel@vger.kernel.org, swati2.sharma@intel.com,
 manasi.d.navare@intel.com, robdclark@gmail.com, daniel@ffwll.ch,
 bhanuprakash.modem@intel.com, dmitry.baryshkov@linaro.org,
 seanpaul@chromium.org, freedreno@lists.freedesktop.org, maxime@cerno.tech
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 20/01/2023 16:54, Sean Paul wrote:
> On Thu, Jan 19, 2023 at 11:35:32AM +0100, Krzysztof Kozlowski wrote:
>> On 18/01/2023 20:30, Mark Yacoub wrote:
>>> From: Sean Paul <seanpaul@chromium.org>
>>>
>>> This patch adds the register ranges required for HDCP key injection and
>>
>> Do not use "This commit/patch".
>> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95
>>
>> This applies to all your patches. Fix it everywhere.
> 
> My goodness, this is peak bikeshedding. Surely we have better things to do with
> our time?

What do you mean "better things to do"? I review the patches as that's
expected from maintainer. I spend a lot of time on so indeed I could
find some other ways to use it.

I spot something which is obvious mistake, although trivial and not
important, but clicking automated answer is also trivial for me and
fast. And yes. 90% of my reviews answers are automated because people
cannot learn to test before sending, cannot learn to read Submitting
Patches and many other trivial things. Clicking this automated answer
was also trivial from my point, but entire discussion including your
disagreement about incorrect title (read Submitting Patches) instead of
just implementing it - is waste of time.

I'll then consider not wasting time on your patches.

Best regards,
Krzysztof

