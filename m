Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A478D0033
	for <lists+freedreno@lfdr.de>; Mon, 27 May 2024 14:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DDA310E3C0;
	Mon, 27 May 2024 12:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="tA47eQpR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC32910E3C0
 for <freedreno@lists.freedesktop.org>; Mon, 27 May 2024 12:39:39 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-420298ff5b1so108988945e9.1
 for <freedreno@lists.freedesktop.org>; Mon, 27 May 2024 05:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1716813577; x=1717418377;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PQ2XKQ4bi3ifBt7xklb3YobX7rwSn+TKhRl1RNG+ius=;
 b=tA47eQpRiV3WEGtNRn5MY5W61bsqCOXubNHwktylprM9fOLi4wquCv7MbanKQXtW2q
 maqFa7lskNKq2Xgt4WKCw6vDkFZ2gaZnMSM70AKjuYciOnnFBY8f0dxhUqbnNew+Cp3i
 zCOFDj0HWMmKcChxtDsiJv7ntSALmHuIcLHY+CUpvnBhfh4VWJh+fYQwqqkdMRZmU9/0
 ilsnn1LNTEWElQE9qoW1IVRCSfqhQNVhrJilm2+08gtfTTcP85nD+f2APv/OqbM6VW3s
 qibOdiv9CiYwgt1KljDLClLoZWhPt6GIg8irr+DdsJtOEZv/heZcdpCrBB2VAnNNPFxa
 v78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716813577; x=1717418377;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PQ2XKQ4bi3ifBt7xklb3YobX7rwSn+TKhRl1RNG+ius=;
 b=uRx1qfCDNNB7eH0l6KCoOjZ1r7WZXwWvHTqUD2Jrlzie2X3Z2Veg/X6iwZUEUpy0pS
 XEMrnNR9pjUecsBcZIW1VJkZs5JwCwCePhErajaw669iBdoky9YWC22eLhbTRyDQ5l81
 qMvwKpgf0tB57XP5Cl9irMfQy0FqbA1/bMoJ8YPx169qT6oE3nuUnvd5BjrHitaX576W
 WVvT8B/E78Zs2+IXK3nD68a8S7+PVsnPDxVudNRLdinLoSadKJS93UpbF1qChvilFBmH
 afGgbiXzJLko3/A/xEhBNdG+f9FKp8NPZEkJuY66oElDikEjHVpeXXKbDnb80EE0F/OU
 g72g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwqBp9GT6ygSq/wLOHT/+H/5qsSr0XzMl6M8n6RCRfwytTQIkWPtqxIhPBRXcMFmQYzVZcNewDEjezLTCXjdrn38MFchBH7ukEFDw3yk3i
X-Gm-Message-State: AOJu0YwqtqXwiClR+DSZcobs2nqDBTWASfxrLRC7/puojTg767IJgEIl
 CM6Q+tWuem0chEWh/WdcJa20vJjyj0yPmWuyAq66dfA9IJJwwluDYJbWai2Z3Q==
X-Google-Smtp-Source: AGHT+IFVLBxasdwVOhT2j5f/keRUhVa56DZAdVC1Btu0N3UElKx9sJlE6aIBx9G82O6BBBp8U1pqHA==
X-Received: by 2002:a05:600c:2245:b0:420:1426:8485 with SMTP id
 5b1f17b1804b1-42108a40f5cmr78096895e9.14.1716813577476; 
 Mon, 27 May 2024 05:39:37 -0700 (PDT)
Received: from [192.168.108.89] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-420fd37d5c0sm82931965e9.1.2024.05.27.05.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 05:39:37 -0700 (PDT)
Message-ID: <e4c2e552-9004-4735-a3b3-ba1f50a145ac@freebox.fr>
Date: Mon, 27 May 2024 14:39:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1] drm/msm: add msm8998 hdmi phy/pll support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, MSM <linux-arm-msm@vger.kernel.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Luca Weiss <luca.weiss@fairphone.com>,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
References: <63337d63-67ef-4499-8a24-5f6e9285c36b@freebox.fr>
 <CAA8EJpptbpRj2htzcsXAiwQe-1Xdgoev-mdMki2OApm3gMEBcw@mail.gmail.com>
Content-Language: en-US, fr
From: Arnaud Vrac <avrac@freebox.fr>
In-Reply-To: <CAA8EJpptbpRj2htzcsXAiwQe-1Xdgoev-mdMki2OApm3gMEBcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 27/05/2024 14:11, Dmitry Baryshkov wrote:
> On Thu, 23 May 2024 at 18:14, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
>>
>> From: Arnaud Vrac <avrac@freebox.fr>
>>
>> Ported from the downstream driver.
>>
>> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>> ---
>>   drivers/gpu/drm/msm/Makefile             |   1 +
>>   drivers/gpu/drm/msm/hdmi/hdmi.c          |   1 +
>>   drivers/gpu/drm/msm/hdmi/hdmi.h          |   8 +
>>   drivers/gpu/drm/msm/hdmi/hdmi.xml.h      | 162 ++++
>>   drivers/gpu/drm/msm/hdmi/hdmi_phy.c      |   5 +
>>   drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 941 +++++++++++++++++++++++
>>   6 files changed, 1118 insertions(+)
>>   create mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
>>
>> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
>> index b21ae2880c715..5b5d6aded5233 100644
>> --- a/drivers/gpu/drm/msm/Makefile
>> +++ b/drivers/gpu/drm/msm/Makefile
>> @@ -26,6 +26,7 @@ msm-$(CONFIG_DRM_MSM_HDMI) += \
>>          hdmi/hdmi_phy.o \
>>          hdmi/hdmi_phy_8960.o \
>>          hdmi/hdmi_phy_8996.o \
>> +       hdmi/hdmi_phy_8998.o \
>>          hdmi/hdmi_phy_8x60.o \
>>          hdmi/hdmi_phy_8x74.o \
>>          hdmi/hdmi_pll_8960.o \
>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
>> index c8ebd75176bba..2a2ce49ef5aa3 100644
>> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
>> @@ -549,6 +549,7 @@ static void msm_hdmi_dev_remove(struct platform_device *pdev)
>>   }
>>
>>   static const struct of_device_id msm_hdmi_dt_match[] = {
>> +       { .compatible = "qcom,hdmi-tx-8998", .data = &hdmi_tx_8974_config },
> 
> Missing DT bindings.
> 
>>          { .compatible = "qcom,hdmi-tx-8996", .data = &hdmi_tx_8974_config },
>>          { .compatible = "qcom,hdmi-tx-8994", .data = &hdmi_tx_8974_config },
>>          { .compatible = "qcom,hdmi-tx-8084", .data = &hdmi_tx_8974_config },
>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
>> index ec57864403915..cad0d50c82fbc 100644
>> --- a/drivers/gpu/drm/msm/hdmi/hdmi.h
>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
>> @@ -137,6 +137,7 @@ enum hdmi_phy_type {
>>          MSM_HDMI_PHY_8960,
>>          MSM_HDMI_PHY_8x74,
>>          MSM_HDMI_PHY_8996,
>> +       MSM_HDMI_PHY_8998,
>>          MSM_HDMI_PHY_MAX,
>>   };
>>
>> @@ -154,6 +155,7 @@ extern const struct hdmi_phy_cfg msm_hdmi_phy_8x60_cfg;
>>   extern const struct hdmi_phy_cfg msm_hdmi_phy_8960_cfg;
>>   extern const struct hdmi_phy_cfg msm_hdmi_phy_8x74_cfg;
>>   extern const struct hdmi_phy_cfg msm_hdmi_phy_8996_cfg;
>> +extern const struct hdmi_phy_cfg msm_hdmi_phy_8998_cfg;
>>
>>   struct hdmi_phy {
>>          struct platform_device *pdev;
>> @@ -184,6 +186,7 @@ void __exit msm_hdmi_phy_driver_unregister(void);
>>   #ifdef CONFIG_COMMON_CLK
>>   int msm_hdmi_pll_8960_init(struct platform_device *pdev);
>>   int msm_hdmi_pll_8996_init(struct platform_device *pdev);
>> +int msm_hdmi_pll_8998_init(struct platform_device *pdev);
>>   #else
>>   static inline int msm_hdmi_pll_8960_init(struct platform_device *pdev)
>>   {
>> @@ -194,6 +197,11 @@ static inline int msm_hdmi_pll_8996_init(struct platform_device *pdev)
>>   {
>>          return -ENODEV;
>>   }
>> +
>> +static inline int msm_hdmi_pll_8998_init(struct platform_device *pdev)
>> +{
>> +       return -ENODEV;
>> +}
>>   #endif
>>
>>   /*
>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.xml.h b/drivers/gpu/drm/msm/hdmi/hdmi.xml.h
>> index 973b460486a5a..c9ca1101b5ad4 100644
>> --- a/drivers/gpu/drm/msm/hdmi/hdmi.xml.h
>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.xml.h
>> @@ -1396,4 +1396,166 @@ static inline uint32_t HDMI_8x60_PHY_REG1_OUTVOL_SWING_CTRL(uint32_t val)
>>   #define REG_HDMI_PHY_QSERDES_TX_LX_TX_ALOG_INTF_OBSV           0x00000110
>>
>>
>> +#define REG_HDMI_8998_PHY_CFG                                  0x00000000
>> +
>> +#define REG_HDMI_8998_PHY_PD_CTL                               0x00000004
>> +
>> +#define REG_HDMI_8998_PHY_MODE                                 0x00000010
>> +
>> +#define REG_HDMI_8998_PHY_CLOCK                                        0x0000005c
>> +
>> +#define REG_HDMI_8998_PHY_CMN_CTRL                             0x00000068
>> +
>> +#define REG_HDMI_8998_PHY_STATUS                               0x000000b4
>> +
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_ATB_SEL1                 0x00000000
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_ATB_SEL2                 0x00000004
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_FREQ_UPDATE              0x00000008
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_BG_TIMER                 0x0000000c
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_SSC_EN_CENTER            0x00000010
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_SSC_ADJ_PER1             0x00000014
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_SSC_ADJ_PER2             0x00000018
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_SSC_PER1                 0x0000001c
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_SSC_PER2                 0x00000020
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_SSC_STEP_SIZE1           0x00000024
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_SSC_STEP_SIZE2           0x00000028
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_POST_DIV                 0x0000002c
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_POST_DIV_MUX             0x00000030
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_BIAS_EN_CLKBUFLR_EN      0x00000034
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_CLK_ENABLE1              0x00000038
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_SYS_CLK_CTRL             0x0000003c
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_SYSCLK_BUF_ENABLE                0x00000040
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_PLL_EN                   0x00000044
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_PLL_IVCO                 0x00000048
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_CMN_IETRIM               0x0000004c
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_CMN_IPTRIM               0x00000050
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_CP_CTRL_MODE0            0x00000060
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_CP_CTRL_MODE1            0x00000064
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_PLL_RCTRL_MODE0          0x00000068
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_PLL_RCTRL_MODE1          0x0000006c
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_PLL_CCTRL_MODE0          0x00000070
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_PLL_CCTRL_MODE1          0x00000074
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_PLL_CNTRL                        0x00000078
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_BIAS_EN_CTRL_BY_PSM      0x0000007c
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_SYSCLK_EN_SEL            0x00000080
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_CML_SYSCLK_SEL           0x00000084
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_RESETSM_CNTRL            0x00000088
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_RESETSM_CNTRL2           0x0000008c
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP_EN              0x00000090
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP_CFG             0x00000094
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP1_MODE0          0x00000098
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP2_MODE0          0x0000009c
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_LOCK_CMP3_MODE0          0x000000a0
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_DEC_START_MODE0          0x000000b0
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_DEC_START_MODE1          0x000000b4
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_DIV_FRAC_START1_MODE0    0x000000b8
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_DIV_FRAC_START2_MODE0    0x000000bc
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_DIV_FRAC_START3_MODE0    0x000000c0
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_DIV_FRAC_START1_MODE1    0x000000c4
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_DIV_FRAC_START2_MODE1    0x000000c8
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_DIV_FRAC_START3_MODE1    0x000000cc
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_INTEGLOOP_INITVAL                0x000000d0
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_INTEGLOOP_EN             0x000000d4
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_INTEGLOOP_GAIN0_MODE0    0x000000d8
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_INTEGLOOP_GAIN1_MODE0    0x000000dc
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_INTEGLOOP_GAIN0_MODE1    0x000000e0
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_INTEGLOOP_GAIN1_MODE1    0x000000e4
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_VCOCAL_DEADMAN_CTRL      0x000000e8
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_VCO_TUNE_CTRL            0x000000ec
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_VCO_TUNE_MAP             0x000000f0
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_CMN_STATUS               0x00000124
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_RESET_SM_STATUS          0x00000128
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_CLK_SEL                  0x00000138
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_HSCLK_SEL                        0x0000013c
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_CORECLK_DIV_MODE0                0x00000148
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_SW_RESET                 0x00000150
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_CORE_CLK_EN              0x00000154
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_C_READY_STATUS           0x00000158
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_CMN_CONFIG               0x0000015c
>> +
>> +#define REG_HDMI_8998_PHY_QSERDES_COM_SVS_MODE_CLK_SEL         0x00000164
>> +
>> +
>> +#define REG_HDMI_8998_PHY_TXn_EMP_POST1_LVL                    0x00000000
>> +
>> +#define REG_HDMI_8998_PHY_TXn_INTERFACE_SELECT_TX_BAND         0x00000008
>> +
>> +#define REG_HDMI_8998_PHY_TXn_CLKBUF_TERM_ENABLE               0x0000000c
>> +
>> +#define REG_HDMI_8998_PHY_TXn_DRV_LVL_RES_CODE_OFFSET          0x00000014
>> +
>> +#define REG_HDMI_8998_PHY_TXn_DRV_LVL                          0x00000018
>> +
>> +#define REG_HDMI_8998_PHY_TXn_LANE_CONFIG                      0x0000001c
>> +
>> +#define REG_HDMI_8998_PHY_TXn_PRE_DRIVER_1                     0x00000024
>> +
>> +#define REG_HDMI_8998_PHY_TXn_PRE_DRIVER_2                     0x00000028
>> +
>> +#define REG_HDMI_8998_PHY_TXn_LANE_MODE                                0x0000002c
>> +
>>   #endif /* HDMI_XML */
>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
>> index 88a3423b7f24d..95b3f7535d840 100644
>> --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
>> @@ -118,6 +118,9 @@ static int msm_hdmi_phy_pll_init(struct platform_device *pdev,
>>          case MSM_HDMI_PHY_8996:
>>                  ret = msm_hdmi_pll_8996_init(pdev);
>>                  break;
>> +       case MSM_HDMI_PHY_8998:
>> +               ret = msm_hdmi_pll_8998_init(pdev);
>> +               break;
>>          /*
>>           * we don't have PLL support for these, don't report an error for now
>>           */
>> @@ -193,6 +196,8 @@ static const struct of_device_id msm_hdmi_phy_dt_match[] = {
>>            .data = &msm_hdmi_phy_8x74_cfg },
>>          { .compatible = "qcom,hdmi-phy-8996",
>>            .data = &msm_hdmi_phy_8996_cfg },
>> +       { .compatible = "qcom,hdmi-phy-8998",
>> +         .data = &msm_hdmi_phy_8998_cfg },
>>          {}
>>   };
>>
>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
>> new file mode 100644
>> index 0000000000000..28c4824a30e89
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
>> @@ -0,0 +1,941 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2016, The Linux Foundation. All rights reserved.
> 
> No changes since 2016?
> 
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/delay.h>
>> +
> 
> [...]
> 
>> +
>> +static inline u64 pll_cmp_to_fdata(u32 pll_cmp, unsigned long ref_clk)
>> +{
>> +       u64 fdata = ((u64)pll_cmp) * ref_clk * 10;
>> +
>> +       do_div(fdata, HDMI_PLL_CMP_CNT);
>> +
>> +       return fdata;
>> +}
>> +
>> +#if 0
> 
> This should probably go away.
> 
>> +static int pll_get_post_div(struct hdmi_8998_post_divider *pd, u64 bclk)
>> +{
>> +       /* FIXME: use downstream ratio list ? */
>> +       int ratio[] = { 2, 3, 4, 5, 6, 9, 10, 12, 14, 15, 20, 21, 25, 28, 35 };
>> +       int hs_divsel[] = { 0, 4, 8, 12, 1, 5, 2, 9, 3, 13, 10, 7, 14, 11, 15 };
>> +       int tx_band_sel[] = { 0, 1, 2, 3 };
>> +       u64 vco_freq[60];
>> +       u64 vco, vco_optimal;
>> +       int half_rate_mode = 0;
>> +       int vco_optimal_index, vco_freq_index;
>> +       int i, j;
>> +
> 
> So, first of all, the code needs to be cleaned. It contains debugging
> and temporary code all over the place. Such code should be removed
> 
> Second, at some point I worked on moving HDMI PHY drivers to
> drivers/phy. Oh my, it was nearly a year ago.
> https://patchwork.freedesktop.org/series/118210/
> 
> I hope to land the HDMI HPD rework this cycle, then get back to the
> HDMI PHY code. No promises though, just wanted to point out that we
> might need to rework this even further in few months.
> 
> 

Thanks Dmitry. I wasn't planning on sending the patch anywhere in this state, but Marc did so I'll ask some of the questions I had when I wrote this. The first thing I was planning to do was indeed to rebase on your patch series refactoring PHY drivers.

First, I understand the XML files describing registers have been integrated in the kernel tree, so we will have to move the definitions of the 8998 PHY registers there.

Second, the #if 0 code is the phy setup code I tried to write based on the simpler 8996 driver, but it doesn't work, hence the actual compiled code which is a direct port of the downstream code. We'll probably have to dig a little more to ask more detailed questions on the phy internals.

Last, I tried to implement the recalc_rate callback which does not exist downstream but I'm not able to get a correct value with the little data I have on the registers. Is this callback actually needed ? I don't see why the values programmed in the set_rate call could change under our feet.

Thanks,
-Arnaud
