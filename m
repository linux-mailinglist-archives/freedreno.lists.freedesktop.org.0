Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3793C35206F
	for <lists+freedreno@lfdr.de>; Thu,  1 Apr 2021 22:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A7B6ED0D;
	Thu,  1 Apr 2021 20:11:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38096ED0A
 for <freedreno@lists.freedesktop.org>; Thu,  1 Apr 2021 20:11:17 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id u4so3534831ljo.6
 for <freedreno@lists.freedesktop.org>; Thu, 01 Apr 2021 13:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=mhUDqpSrPGJrUC3y7pqQdiWyabW803L1a+YQHPLvBho=;
 b=S9jguAXDEbC9AQ4Fh8k0nFBU4XeGYh3uwL/9uoFDllELILiT+Yl0sQ3m8R9TCU8Ve9
 7tUyMZX3ScnYgmyYTtKhSkpHQWRfNTglbiVu4l1Cfn8VWlOCFTtpRTibwAlW80EUWVUr
 zLRQ7X/2H1Dz/LylTy624HG0BPyYp3J5d4jH75ay7aUY+KhCgqbWbXBzViUb5Tt3RmTM
 za5Gg2H1jPHN/jTIXOCQeUenMLvJFAXaE0BtbsIztzX88O2uZJstQm9GThxh9y37dM5a
 C5++qUEmBualHNLppes+DbOAmtYC5hb6P+kEIjj9cx4oS5QJByp/ArIOMcA5391dVe94
 ACSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=mhUDqpSrPGJrUC3y7pqQdiWyabW803L1a+YQHPLvBho=;
 b=LNN6gcnyv3wyRt0N1yHxLJme9EQ3KZ3u+7qXMOTZB6lG6D75NZbptnQwkn8sjaK/Gl
 2/eYPBOmcm8ZiS9Tbe63pz6AKKLqdA9JmB5AwHkPO7ipKWNMimVaFGwK5HpZ8RWEpD3j
 S4cX9zS/02rGaLLcK+M8tmR5tgaG/xsVbeGehijFIt0pNqsAN/w27WY1ZVCsUlQQKRY/
 AtxHuP65d4h/bFN1GQ5R6hhOaGVNSXBICCtBQ4M4RSZh6ZQiaVjqO5SjDl+kq6Bg7xl+
 9Uw4J2hOpX/bvvI0LAv38d4HAvJoHud3Taqmr3pR+9eH0OoDlZidg0B0iGQUf1I4XQBW
 PLLQ==
X-Gm-Message-State: AOAM531E0kgo34DcYaG0gIMyRyRWkSVBs19TSnUH1ZV+uoAS2Ctd1c5t
 NILcURgUQN1Nuo/3n1vGiUxY4g==
X-Google-Smtp-Source: ABdhPJymsHAJUmUiaWVJ2EFdl8kRUFWJKEn+2UlrxStbtaESaHjtQkjEINDn/Wa/DuGHApcP1BxGxg==
X-Received: by 2002:a2e:981a:: with SMTP id a26mr6388275ljj.204.1617307876092; 
 Thu, 01 Apr 2021 13:11:16 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id w23sm711421lji.127.2021.04.01.13.11.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 13:11:15 -0700 (PDT)
To: linux-firmware@kernel.org
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <63f0c675-d04b-1961-53cd-e621b48dab94@linaro.org>
Date: Thu, 1 Apr 2021 23:11:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Language: en-GB
Subject: [Freedreno] Update firmware for Qualcomm SM8250 platform
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
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hello linux-firmware maintainers,

Could you please pull updated firmware for Qualcomm SM8250-based 
platforms. Firmware successfully tested on Qualcomm Robotics RB5 platform.


The following changes since commit 3f026a2f13a8f130cde849168a111ec80f12e27b:

   rtl_bt: Update RTL8822C BT(UART I/F) FW to 0x59A_76A3 (2021-03-22 
10:17:18 -0400)

are available in the Git repository at:

   https://github.com/lumag/linux-firmware sm8250-new-fw

for you to fetch changes up to d8fa0cfb4a285d11fd7102efd1763f1be90fac99:

   qcom: sm8250: update remoteproc firmware (2021-04-01 23:05:00 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (2):
       qcom: update a650 firmware files
       qcom: sm8250: update remoteproc firmware

  WHENCE                   |   2 +-
  qcom/a650_sqe.fw         | Bin 31488 -> 31804 bytes
  qcom/sm8250/a650_zap.mbn | Bin 13964 -> 13964 bytes
  qcom/sm8250/adsp.mbn     | Bin 15515796 -> 15515796 bytes
  qcom/sm8250/cdsp.mbn     | Bin 5822228 -> 5822228 bytes
  5 files changed, 1 insertion(+), 1 deletion(-)



-- 
With best wishes
Dmitry
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
